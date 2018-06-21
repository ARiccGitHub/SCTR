class Location < ApplicationRecord
  ## Validation
  validates :customer_number, presence: true


  # kaminari gem
  paginates_per 10

  belongs_to :customer
  has_many :machines

end
