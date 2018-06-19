class Account < ApplicationRecord
  ## Device
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Validation
  validates :customer_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  

end
