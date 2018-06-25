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
     ## Location
     resources :locations do
       get 'contact', to: 'locations#contact'
       ## Machine
       resources :machines do
       end
     end
   end
   # Admind dashbord
   resources :adminbords do
   end
   # Locations
   resources :locations do
     get 'contact', to: 'locations#contact'
     ## Machine
     resources :machines do
     end
  end
  # achines
   resources :machines do
   end


    ## Stand alone routes
   # Route to select a customer to add a new machine
   get 'select_customer_new_machine', to: 'adminbords#select_customer_new_machine'
   # Route to select a customer to add a new locatiom
   get 'select_customer_new_location', to: 'adminbords#select_customer_new_location'
   # Route to select a customer to add a new account
   get 'select_customer_new_account', to: 'adminbords#select_customer_new_account'
   # Rout to showaccount
   get 'adminbords/show_account_register/:id', to: 'adminbords#show_account_register', as: 'show_account_register'

end
