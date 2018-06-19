class Customer < ApplicationRecord

  ## Validation
  validates :customer_number, presence: true
  validates :name, presence: true
  validates :phone, presence: true

  has_many :locations

end
