Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 resources :actions

 resources :flights do
  collection do 
    get :country
  end
 end

 #tracks activity of each and every transaction.
 resources :activities do 
  collection do 
    patch :activity
    delete :activity_delete
  end
 end
   

 resources :carbonimpacts  do
    collection do
     post :total_impact
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

#forgot password
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'
end
