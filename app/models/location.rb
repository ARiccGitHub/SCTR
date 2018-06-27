class Location < ApplicationRecord
  ## Validation
  validates :customer_number, presence: true


  # kaminari gem
  paginates_per 5

  belongs_to :customer
  has_many :machines
  has_many :service_calls, through: :machines
  has_many :accounts_locations
  has_many :accounts, through: :accounts_locations
end
