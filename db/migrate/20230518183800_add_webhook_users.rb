# frozen_string_literal: true

class AddWebhookUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :webhook_users do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :url, null: false
      t.timestamps
    end
  end
end
