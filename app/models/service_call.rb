class ServiceCall < ApplicationRecord
  ## Validation
  validates :customer_number, presence: true


  # kaminari gem
  paginates_per 10


  belongs_to :machine
  belongs_to :account
end
