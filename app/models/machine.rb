class Machine < ApplicationRecord
  ## Validation
  


  # kaminari gem
  paginates_per 10

  belongs_to :location
  has_many :service_calls
end
