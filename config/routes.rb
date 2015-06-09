Rails.application.routes.draw do
  get 'users/index'

  get 'admin_app/index'

  devise_for :admins
  devise_for :users
  resources :users, :path => '/admin_app/users'
 # get 'my_auth/index'

  resources :tasks,  :path => '/user_app/tasks'

  resources :user_tasks,  :path => '/user_app/user_tasks'

  resources :ssh_connections,  :path => '/user_app/ssh_connections'

  resources :task_templates,  :path => '/user_app/task_templates'

  resources :templates,  :path => '/user_app/templates'

  resources :tasks,  :path => '/admin_app/tasks'

  resources :user_tasks,  :path => '/admin_app/user_tasks'

  resources :ssh_connections,  :path => '/admin_app/ssh_connections'
   resources :ssh_connections,  :path => '/admin_app/user_control/ssh_connections'
      resources :ssh_connections,  :path => '/admin_app/connections/ssh_connections'

  resources :task_templates,  :path => '/admin_app/task_templates'

  resources :templates,  :path => '/admin_app/templates'

  get 'user_app/ssh_actions/:name/:password' => 'ssh_actions#testConnection'
  get 'user_app/getinf/:name/:password/:command' => 'ssh_actions#runCommand'
  get 'user_app/tasks/:id/getinf/:name/:password/:command' => 'ssh_actions#runCommand'
  get 'user_app/getOutputs/:name/:password/:task_name' => 'ssh_actions#get_outputs'
  post 'user_app/run_command/:params' => 'ssh_actions#runCommand'
  post 'user_app/dell_task/:params' => 'ssh_actions#dell_task'
  get 'user_app/getinf/:name/:password' => 'ssh_actions#getInfo'
  get 'user_app/tasks/:id/getinf/:name/:password' => 'ssh_actions#getInfo'
  post 'user_app/templates/run_command/:params' => 'ssh_actions#runCommand'
  post 'user_app/tasks/dell_task/:params' => 'ssh_actions#dell_task'
  post 'user_app/tasks/:id/dell_task/:params' => 'ssh_actions#dell_task'

  get 'user_app/tasks/:id/get_nodes/:name/:password' => 'ssh_actions#get_nodes'

  get 'admin_app/ssh_actions/:name/:password' => 'ssh_actions#testConnection'
  get 'admin_app/getinf/:name/:password/:command' => 'ssh_actions#runCommand'
  get 'admin_app/getOutputs/:name/:password/:task_name' => 'ssh_actions#get_outputs'
  post 'admin_app/run_command/:params' => 'ssh_actions#runCommand'
  post 'admin_app/dell_task/:params' => 'ssh_actions#dell_task'
  get 'admin_app/getinf/:name/:password' => 'ssh_actions#getInfo'


  #root to: 'application#index'
  root to: 'my_auth#index'

  get 'user_app' => 'application#index'
  get 'user_app/*path' => 'application#index'
  get 'admin_app' => 'admin_app#index'
  get 'admin_app/*path' => 'admin_app#index'
  # # #get 'passport/index'


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
