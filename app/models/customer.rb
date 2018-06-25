class Customer < ApplicationRecord

  ## Validation
  validates :customer_number, presence: true
  #validates :bus_name, presence: true
  validates :phone, presence: true

  # kaminari gem
  paginates_per 10

  has_many :locations
  has_many :machines, through: :locations

  has_many :accounts
  has_many :service_calls, through: :accouts
end
