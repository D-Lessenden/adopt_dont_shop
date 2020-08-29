Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'

  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'

  get '/shelters/:id', to: 'shelters#show'
  get "/shelters/:shelter_id/reviews/new", to: 'reviews#new'
  # post "/shelters/:shelter_id/reviews", to: 'reviews#create'

  post "/reviews/:shelter_id/new", to: 'reviews#create'

  get "/reviews/:id/edit", to: 'reviews#edit'
  # patch "/shelters/:shelter_id/reviews/edit", to: 'reviews#update' # i dont think this is right
  # patch "/reviews/:id", to: 'reviews#show'
  post '/reviews/:id', to: 'reviews#update'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'

  delete '/reviews/:id', to: 'reviews#destroy'

  delete '/shelters/:id', to: 'shelters#destroy'


  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  post 'shelter_pets', to: 'pets#create'


  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'


  get '/pets', to: 'pets#index'
  get '/shelters/pets/new', to: 'pets#new'
  post '/pets', to: 'pets#create'

  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  #patch "/favorites", to: "favorites#update"
  resources :favorites #, only: [:update, :index]
  delete "/favorites", to: "favorites#delete"
  post "/favorites/delete_all", to: "favorites#delete_all"
  delete "/favorites", to: "favorites#destroy_all"


resources :apps
post "apps/new", to: 'apps#create'

end #need to run the db migrate command
  #this is the example from in class exercise rails g migration CreateSongs title:string length:integer play_count:integer
