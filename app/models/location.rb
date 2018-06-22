class Location < ApplicationRecord
  ## Validation
  validates :customer_number, presence: true


  # kaminari gem
  paginates_per 10

  belongs_to :customer
  has_many :machines
  has_many :service_calls, through: :machines
end
