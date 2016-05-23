Rails.application.routes.draw do
  resources :highschools
  resources :universities
  resources :type_of_studies
  resources :professions
  resources :mode_of_studies
  resources :higher_education_institutions
  resources :higher_education_institutions
  resources :higher_education_institutions
  resources :highschool_completions
  resources :posts
  resources :countries
  resources :elements
  resources :citizens
  resources :municipalities

  # Route concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  # App routes
  root 'home#index'

  devise_for :users, skip: :registrations, controllers: { confirmations: 'confirmations' }

  as :user do
    get '/users/sign_up' => 'devise/registrations#new', as: :new_user_registration
    post '/users' => 'devise/registrations#create', as: :user_registration

    patch '/users/confirmations' => 'confirmations#update', via: :patch, as: :update_user_confirmation
  end

  namespace :admin do
    resources :users, except: :show, concerns: :paginatable do
      resources :faculties, only: [:index, :create, :destroy]
    end
  end

  resources :users, only: [:edit, :update]
  resources :study_programs
  resources :study_program_modes
  resources :application_forms

  resources :codes, only: :index

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
