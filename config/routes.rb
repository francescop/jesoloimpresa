Jesoloimpresa::Application.routes.draw do

  resources :announcements

#match 'annunci/:announcementcategory_id/:id' => 'announcements#show', :as => :show

  resources :announcementcategories, :path => 'annunci' do
    resources :announcements, :path => 'annuncio'
  end 

  resources :banners

  get "maps/index"

  resources :news

  get "sito/index"

#  get "sito/contatti"

  get "sessions/create"

  get "sessions/destroy"
  
  match 'login' => 'sessions#new', :as => :new
  match 'logout'=> 'sessions#destroy', :as => :destroy
  match 'maps/search'=>'maps#search', :as => :search
  match 'maps/percorso'=>'maps#percorso', :as => :percorso

  match 'contatti' => 'sito#contatti', :as => :contatti
  match 'servizi' => 'sito#servizi', :as => :servizi
  match 'chisiamo' => 'sito#chisiamo', :as => :chisiamo


#  match 'nuovoannuncio' => 'announcements#new', :as => :new

  match 'pubblicita' => 'sito#pubbli', :as => :pubbli
  match 'disclaimer' => 'sito#disclaimer', :as => :disclaimer
  match 'privacy' => 'sito#privacy', :as => :privacy
  match 'mobile' => 'sito#mobile', :as => :mobile

#####################


#match 'categorie' => 'categories#index', :as => :index

match 'aziende-a-jesolo' => 'categories#index', :as => :index
match 'aziende-a-jesolo/:id' => 'categories#show'
#match 'categorie/:category_id' => 'activity.category#show', :as => :show
match 'categorie/:category_id/:id' => 'activities#show', :as => :show

#####################

  resources :sessions
  
  resources :activities

  resources :sito

  resources :categories, :path => 'aziende-a-jesolo' do
#       get 'list', :on => :collection
        resources :activities, :path => '/'
  end

  resources :maps do
    get 'search'
    get 'index'
  end

root :to => 'sito#index'
  
  #match ':controller(/:action(/:id(.:format)))'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end