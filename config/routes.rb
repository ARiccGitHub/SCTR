Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## Home page
  root "webpages#index"

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

   ## Customer
   resources :customers do
     get 'main_contact', to: 'customers#main_contact'
     get 'select', to: 'customers#select'
     ## Location
     resources :locations do
       get 'contact', to: 'locations#contact'
       ## Machine
       resources :machines do
       end
     end
   end
   resources :locations do
     get 'contact', to: 'locations#contact'
     ## Machine
  end
   resources :machines do
   end
   authenticated :admin do
    root 'customers#index', as: :authenticated_root
  end

  unauthenticated :admin do
    root "webpages#index", as: :unauthenticated_root
  end

end
