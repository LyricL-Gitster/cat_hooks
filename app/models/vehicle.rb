# frozen_string_literal: true

class Vehicle < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :count, numericality: { only_integer: true }
end
