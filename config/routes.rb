Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'

  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  # get '/shelters/:id', to: 'shelters#index'
  # get '/shelters/:shelter_id/pets', to: 'shelters#pets'
  #user story 8

  get '/pets', to: 'pets#index'
  get '/pets/new', to: 'pets#new'
  post '/pets', to: 'pets#create'

  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'



end #need to run the db migrate command
  #this is the example from in class exercise rails g migration CreateSongs title:string length:integer play_count:integer
