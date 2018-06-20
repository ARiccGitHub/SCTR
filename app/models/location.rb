class Location < ApplicationRecord
  ## Validation
  validates :customer_number, presence: true
  validates :bus_name, presence: true

  belongs_to :customer
end
