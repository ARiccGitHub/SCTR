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
   devise_for :accounts, path: 'contacts', controllers: {
     sessions: "accounts/sessions",
     passwords: "accounts/passwords",
     registrations: "accounts/registrations",
     confirmations: "accounts/confirmations"
   }


  ## Home page
  root "webpages#index"

  # Admind dashbord
  resources :adminbords do
  end

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
  # Route to select a customer before creating a location
   get 'select_customer', to: 'adminbords#select_customer'

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

end
