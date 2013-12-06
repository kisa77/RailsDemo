Demo::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
##    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
##    devise_for :managers

    resources :users

    resources :products

    resources :line_items
    resources :carts
    resources :people
    resources :event

    get "store/index"

    # user
    get "login" => "users#login"
    post "login" => "users#create_session"
    get "logout" => "users#logout"
    get 'admin' => "admin/index#hello"

    # 等价于
    # get    '/event'          => "event#index",   :as => "event"
    # post   '/event'          => "event#create",  :as => "event"
    # get    '/event/:id'      => "event#show",    :as => "event"
    # put    '/event/:id'      => "event#update",  :as => "event"
    # delete '/event/:id'      => "event#destroy", :as => "event"
    # get    '/event/new'      => "event#new",     :as => "new_event"
    # get    '/event/:id/edit' => "event#edit",    :as => "edit_event"


    #root 'welcome#index'
    root :to => 'store#index', :as => 'store'
    get "welcome/say_hello" => "welcome#say"

##    get "event/index" => "event#index"
##    get "event/show" => "event#show"
##    get "event/destroy" => "event#destroy"
##    ## fuck you!!!
##    patch "event/update" => "event#update"
##    delete "event/update" => "event#destroy"
##    post "event/create" => "event#create"
##    get "event/edit" => "event#edit"
##    get "event/new" => "event#new"

    #match ':controller(/:action(/:id(.:format)))'

##    match 'event/(:action)' => 'event#(:action)',
##                     :via   => [:get, :post],
##                 :defaults  => { :action => "index" }


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
##  match ':controller(/:action(/:id(.:format)))'
end
