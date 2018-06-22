class Account < ApplicationRecord
  ## Device
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # kaminari gem
 paginates_per 10

 belongs_to :customer
 has_many :service_calls
end
