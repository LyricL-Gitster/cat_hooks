# frozen_string_literal: true

require "rails_helper"

RSpec.describe "VehiclesController", type: :request do
  describe "#create" do
    it "calls WebhookUserService on success" do
      allow(WebhookUserService).to receive(:notify_all_async!)

      post vehicles_url({ name: "test1" })

      expect(response.status).to eq(200)
      expect(WebhookUserService).to have_received(:notify_all_async!)
    end

    it "does not call WebhookUserService on failure" do
      allow(WebhookUserService).to receive(:notify_all_async!)

      post vehicles_url({})

      expect(response.status).to eq(400)
      expect(WebhookUserService).not_to have_received(:notify_all_async!)
    end
  end

  describe "#update" do
    it "calls WebhookUserService on success" do
      vehicle = Vehicle.new
      allow(Vehicle).to receive(:find).and_return(vehicle)
      allow(vehicle).to receive(:update).and_return(true)
      allow(WebhookUserService).to receive(:notify_all_async!)

      put vehicle_url(42, { name: "test1" })

      expect(response.status).to eq(200)
      expect(WebhookUserService).to have_received(:notify_all_async!)
    end

    it "does not call WebhookUserService on failure" do
      vehicle = Vehicle.new
      allow(Vehicle).to receive(:find).and_return(vehicle)
      allow(vehicle).to receive(:update).and_return(false)
      allow(WebhookUserService).to receive(:notify_all_async!)

      put vehicle_url(42, { name: "test1" })

      expect(response.status).to eq(400)
      expect(WebhookUserService).not_to have_received(:notify_all_async!)
    end
  end

  describe "#destroy" do
    it "calls WebhookUserService on success" do
      vehicle = Vehicle.new
      allow(Vehicle).to receive(:find).and_return(vehicle)
      allow(vehicle).to receive(:destroy).and_return(true)
      allow(WebhookUserService).to receive(:notify_all_async!)

      delete vehicle_url(42, { name: "test1" })

      expect(response.status).to eq(200)
      expect(WebhookUserService).to have_received(:notify_all_async!)
    end

    it "does not call WebhookUserService on failure" do
      vehicle = Vehicle.new
      allow(Vehicle).to receive(:find).and_return(vehicle)
      allow(vehicle).to receive(:destroy).and_return(false)
      allow(WebhookUserService).to receive(:notify_all_async!)

      delete vehicle_url(42, { name: "test1" })

      expect(response.status).to eq(400)
      expect(WebhookUserService).not_to have_received(:notify_all_async!)
    end
  end
end
