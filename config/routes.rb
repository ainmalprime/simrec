DeVryEHR::Application.routes.draw do

  resources :recent_activities

  resources :site_configurations
  match "config/:id", to: 'site_configurations#set_config', as: :config

  resources :users
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#signout', via: :delete
  match '/simulation', :to => 'sessions#simulation_mode'
  match '/edit', :to => 'sessions#edit_mode'
  match '/reset_sim', to: 'sessions#reset_sim'
  match '/review', to: 'sessions#review'
  
  resources :lab_report_templates

  match '/home',    :to => 'static_pages#home'

  match '/search',  :to => 'static_pages#search'

  match '/patients/lab_reports/:id', :to => 'patients#lab_reports'


  
  resources :order_types

  resources :intake_documents

  resources :image_files
  match "image/:id", :to => 'image_files#code_image'

  resources :lab_and_diagnostic_reports

  resources :clinician_orders
  match '/clinician_orders_ajax_new', :to => 'clinician_orders#ajax_new'

  resources :flow_sheet_records
  match '/flow_sheet_records_ajax_new', :to => 'flow_sheet_records#ajax_new'

  root :to => 'static_pages#home'


  resources :medical_administration_records
  match '/medical_administration_records_ajax_new', :to => 'medical_administration_records#ajax_new'

  resources :clinician_notes
  match '/clinician_notes_ajax_new', :to => 'clinician_notes#ajax_new'

  resources :visits

  resources :patients

  resources :sessions


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
