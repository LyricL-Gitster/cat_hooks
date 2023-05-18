# frozen_string_literal: true

require "rails_helper"

RSpec.describe "WebhookUserService" do
  describe "#notify_all_async!" do
    it "calls notify_async! for each found WebhookUser" do
      user_count = 42
      webhook_users = Array.new(user_count, WebhookUser.new)
      receive_find_each_and_yield = receive(:find_each)
      webhook_users.each do |wu|
        receive_find_each_and_yield = receive_find_each_and_yield.and_yield(wu)
      end
      allow(WebhookUser).to receive_find_each_and_yield
      allow(WebhookUserService).to receive(:notify_async!)

      WebhookUserService.notify_all_async!.join

      expect(WebhookUserService).to have_received(:notify_async!).exactly(user_count).times
    end
  end

  describe "#notify_async!" do
    it "sends a post request via Net::HTTP to the correct url" do
      url = "https://ghostbustersnews.com/"
      wu = WebhookUser.new(url:)
      allow(Net::HTTP).to receive(:post_form).and_return(Net::HTTPResponse.new(nil, nil, nil))

      WebhookUserService.notify_async!(wu).join

      expect(Net::HTTP).to have_received(:post_form).with(URI.parse(url), {})
    end
  end
end
