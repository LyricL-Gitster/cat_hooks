# frozen_string_literal: true

require "uri"
require "net/http"

class WebhookUserService
  class << self
    def notify_all_async!
      Thread.new do
        WebhookUser.find_each { |wu| notify_async! wu }
      end
    end

    def notify_async!(webhook_user)
      Thread.new do
        Rails.logger.info "***** Notifying Webhook User #{webhook_user.name} *****"
        res = Net::HTTP.post_form(URI.parse(webhook_user.url), {})
        Rails.logger.info "#{webhook_user.name} => #{res.code}"
      end
    end
  end
end
