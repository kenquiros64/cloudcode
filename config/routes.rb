Rails.application.routes.draw do
 

  resources :folders 
  resources :archives
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  
  #match "archives/update/:id" => "archives#update", :as => "save", via: :update
  match "archives/get/:id" => "archives#get", :as => "download", via: :get
  match "browse/:folder_id" => "home#browse", :as => "browse", via: :get
  match "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder", via: :get
  match "browse/:folder_id/new_file" => "archives#new", :as => "new_sub_file", via: :get
  match "browse/:folder_id/rename" => "folders#edit", :as => "rename_folder", via: :get
  get 'home/public' => 'home#public', :as => "public"
  match "public_browse/:folder_id" => "home#public_browse", :as => "public_browse", via: :get

  resources :folders do
    resources :archives do
    end
  end

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
