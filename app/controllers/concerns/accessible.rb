# Fix cross model visits (fancy name for: Users can visit admins login and viceversa and mess up your auth tokens)
# ActionController::InvalidAuthenticityToken happens when a logged in Devise model (eg. User) logs in,
# in the same browser,
# as another Devise Model (eg. Admin)
#
# A technical issue with this type of setup, however,
# is that a signed in devise user will be able to access sign in
# and login pages of another devise user. This is definitely not a desired result.
#
# As a solution, a simple concern can be implemented

# module Accessible
#   extend ActiveSupport::Concern
#   included do
#     before_action :check_user
#   end
#
#   protected
#   def check_user
#     if current_admin
#       flash.clear
#       # if you have rails_admin. You can redirect anywhere really
#       redirect_to(admin_session_path) && return
#     elsif current_account
#       flash.clear
#       # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
#       redirect_to(account_session_path) && return
#     end
#   end
# end
