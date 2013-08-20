EmpApp::Application.routes.draw do

  

  resources :evaluations


  resources :request_skills


  resources :desired_skills


  resources :developer_skills


  resources :skills

  get "my_requests" => "project_requests#my_requests", :as => "_my_requests"
  get "static_pages/home"
  
 match '/signup', to: 'employees#new'
 root to:  'static_pages#home'
#root to: 'project_requests#index'
 #match '/', to: 'project_requests#index'
 match '/', to: 'static_pages#home'
  match '/signup', to: 'employees#new'
   match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
 #match "/dashboard", to: 'dashboard#index', :as => "request_report"
  match '/dashboard', to: 'dashboard#index'
  match 'request_report' => 'dashboard#request_report', :as => '_request_report'
  match 'overall_report' => 'dashboard#overall_report', :as => '_overall_report'
  match 'time_report' => 'dashboard#time_report', :as => '_time_report'
  match 'developer_skill_report' => 'dashboard#developer_skill_report', :as => '_developer_skill_report'
  match 'average_report' => 'dashboard#average_report', :as => '_average_report'
  match 'shared_report' => 'dashboard#shared_report', :as => '_shared_report'
  match 'volunteer_report' => 'dashboard#volunteer_report', :as => '_volunteer_report'
 #root to: 'sessions#new'
  
  

  resources :responses do
    resources :request_selections
  end


  resources :request_selections do
    resources :rewards
  end
  resources :rewards do
    resources :evaluations
  end

  resources :employees do
    resources :rewards
  end

  resources :project_requests do
    resources :responses
  end


  resources :employees 
  resources :sessions, only: [:new, :create, :destroy]
   

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
