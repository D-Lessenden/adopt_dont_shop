Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'

  get '/shelters/:id', to: 'shelters#show'
  #get '/shelter_1', to: 'shelter_1#index'
  #get '/shelters', to: 'shelters#index'
  #get '/shelters/new', to: 'shelters#new'
  #post '/shelters', to: 'shelters#create'
end #need to run the db migrate command
  #this is the example from in class exercise rails g migration CreateSongs title:string length:integer play_count:integer
