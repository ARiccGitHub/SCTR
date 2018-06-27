class ServiceCall < ApplicationRecord
  ## Validation
  


  # kaminari gem
  paginates_per 10

  belongs_to :account
  belongs_to :machine
end
