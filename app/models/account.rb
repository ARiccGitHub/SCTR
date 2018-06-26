class Account < ApplicationRecord
  ## Device
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

## validation
  # presence false will allowed the account to be creared with out
  # a customer_id
validates :customer_number, presence: true
validates :first_name, presence: true
 # kaminari gem
 paginates_per 10

 belongs_to :customer
 has_many :service_calls
 has_many :permit_account
 has_many :accounts_locations
 has_many :locations, through: :accounts_locations
end
