Rails.application.routes.draw do
  resources :klasius_srvs
  resources :highschools
  resources :universities
  resources :type_of_studies
  resources :professions
  resources :mode_of_studies
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

  get '/my/programs' => 'home#my_programs'

  namespace :admin do
    resources :users, except: :show, concerns: :paginatable do
      resources :faculties, only: [:index, :create, :destroy]
    end
  end

  resources :codes, only: :index

  resources :users, only: [:edit, :update, :destroy]

  get '/study_programs/pdf_export/' => 'study_programs#pdf_export_list', via: :get, as: 'export_study_programs'

  get '/study_programs/:study_program_id/candidates/pdf_export/' => 'study_program_candidates#pdf_export', as: 'export_study_program_candidates'

  resources :study_programs do
    resources :study_program_modes, except: :show, concerns: :paginatable
    resources :study_program_candidates, only: :index, concerns: :paginatable
    resources :requirements do
      resources :requirement_elements
      resources :study_program_elements
    end
  end

  get '/candidates/pdf_export/' => 'candidates#pdf_export', via: :get, as: 'export_candidates'
  get '/candidates/:id/pdf_export_show/' => 'candidates#pdf_export_show', via: :get, as: 'export_candidate'

  resources :study_program_modes
  resources :candidates, only: [:index, :show], concerns: :paginatable
  resources :application_forms, except: :show do
    resources :choices
  end

  get '/application_forms/all' => 'application_forms#all_applications', via: :get,  as: 'all_application_form'
  get '/application_forms/:id/send' => 'application_forms#send_application', via: :get,  as: 'send_application_form'
  get '/application_forms/:id/pdf_export/' => 'application_forms#pdf_export', via: :get, as: 'export_application_form'

  get '/study_programs/:id/pdf_export/' => 'study_programs#pdf_export', via: :get, as: 'export_study_program'

  resources :completion_results, only: :index, concerns: :paginatable do
    resources :completion_result_scores, except: :show, concerns: :paginatable
  end

  resources :element_results, only: :index, concerns: :paginatable do
    resources :element_result_scores, except: :show, concerns: :paginatable
  end

  resources :import_results, only: :index

  post '/import_results/splosna_matura' => 'import_results#splosna_matura', as: 'import_splosna_matura'
  post '/import_results/splosna_matura_predmeti' => 'import_results#splosna_matura_predmeti', as: 'import_splosna_matura_predmeti'
  post '/import_results/poklicna_matura' => 'import_results#poklicna_matura', as: 'import_poklicna_matura'
  post '/import_results/poklicna_matura_predmeti' => 'import_results#poklicna_matura_predmeti', as: 'import_poklicna_matura_predmeti'

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
