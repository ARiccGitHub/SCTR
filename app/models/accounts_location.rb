class AccountsLocation < ApplicationRecord
  belongs_to :account
  belongs_to :location
end
