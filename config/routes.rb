Damon::Application.routes.draw do
  resources :passwords

  resources :exams

  resources :medical_exams

  resources :employees do
    collection {
     post :import
     post :add_vaccine
     post :add_disease
     post :search
     post :updatepassword
    }
  end
  resources :patients
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root  'patients#index'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/newpatient',  to: 'patients#new',     via: 'get'
  match '/showpatient',  to: 'patients#show',     via: 'get'
  match '/enterpatient',  to: 'patients#enter',   via: 'get'
  match '/oldpatient',  to: 'sessions#destroy', via: 'delete'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/add_DB', to: 'employees#add_DB', via: 'post'
  match '/editdatabase', to: 'employees#edit_DB', via: 'get'
  match '/statistics', to: 'employees#statistics', via: 'get'
  match '/done_exams_employees', to: 'employees#doneExams', via: 'get'
  match '/miss_exams_employees', to: 'employees#missExams', via: 'get'
  match '/employeesexams', to: 'employees#employees_exams', via: 'get'
  match '/delete_vaccine', to: 'employees#delete_vaccine', via: 'get'
  match '/delete_disease', to: 'employees#delete_disease', via: 'get'
  match '/miss_employees', to: 'employees#miss_employees', via: 'get'
  match '/change_password', to: 'employees#change_password', via: 'get'

  # root_path -> '/'
  # root_url  -> 'http://localhost:3000/'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
