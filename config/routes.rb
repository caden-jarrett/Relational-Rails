Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/lead_actors', to: 'lead_actors#index'
  get '/lead_actors/new', to: 'lead_actors#new'
  get '/lead_actors/:id', to: 'lead_actors#show'
  post '/lead_actors', to: 'lead_actors#create'

  get '/lead_actors/:id/movies', to: 'lead_actor_movies#index'
end
