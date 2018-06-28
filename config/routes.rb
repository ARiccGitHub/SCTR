Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## Devise routes modifed to match generated folder with scope
  # Admin
   devise_for :admins, path: 'admins', controllers: {
     sessions: "admins/sessions",
     passwords: "admins/passwords",
     registrations: "admins/registrations",
     confirmations: "admins/confirmations"
   }
   # Account
   devise_for :accounts, path: 'accounts', controllers: {
     sessions: "accounts/sessions",
     passwords: "accounts/passwords",
     registrations: "accounts/registrations",
     confirmations: "accounts/confirmations"
   }

  ## Home page
  root "webpages#index"

   ## Customer
   resources :customers do
     # Route to Customer main contact
     get 'main_contact', to: 'customers#main_contact'
     # Route to select a location before creating a machine
     get 'select_location', to: 'customers#select_location'
     resources :locations do
       get 'contact', to: 'locations#contact'
       get 'select_machine_service', to: 'locations#select_machine_service'
       ## Machine
       resources :machines do
         resources :service_calls do
         end
       end
     end
   end
   # Admind dashbord
   resources :adminbords do
     # Route to show account
     collection do
       # collect selected accout locations
       get 'select_account_locations/:account_id', to: 'adminbords#select_account_locations', as: 'select_account_locations'
     end
     # Route to Account Index
     get 'accounts', to: 'adminbords#accounts'
   end
   # Locations
   resources :locations do
     get 'contact', to: 'locations#contact'
     ## Machine
     resources :machines do
       resources :service_calls do
       end
     end
  end
  # achines
   resources :machines do
     resources :service_calls do
     end
   end
   resources :service_calls do
   end


    ## Stand alone routes
   # Route to select a customer to add a new machine
   get 'select_customer_new_machine', to: 'adminbords#select_customer_new_machine'
   # Route to select a customer to add a new locatiom
   get 'select_customer_new_location', to: 'adminbords#select_customer_new_location'
   # Route to select a customer to add a new account
   get 'select_customer_new_account', to: 'adminbords#select_customer_new_account'
   # Route to show account
   get 'adminbords/show_account_register/:account_id', to: 'adminbords#show_account_register', as: 'show_account_register'
   # Post accounts locations
   post 'adminbords/save_account/:account_id/locations/:selected_locations_ids', to: 'adminbords#save_account_locations', as: 'save_account_locations'
end
