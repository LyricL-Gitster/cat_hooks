# frozen_string_literal: true

class AddVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :count, null: false, default: 0
      t.timestamps
    end
  end
end
