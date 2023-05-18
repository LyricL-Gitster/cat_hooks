# frozen_string_literal: true

class WebhookUser < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
end
