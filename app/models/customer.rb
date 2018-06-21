class Customer < ApplicationRecord

  ## Validation
  validates :customer_number, presence: true
  validates :name, presence: true
  validates :phone, presence: true

  # kaminari gem
  paginates_per 10

  has_many :locations
  has_many :machines, through: :locations
end
