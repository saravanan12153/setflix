Rails.application.routes.draw do


  resources :genres
  get 'signup' => 'users#new'
  get "signin" => "sessions#new"
  resources :users
  root "movies#index"
  resource :session

  # get "movies" => "movies#index"

  # get "movies/:id" => "movies#show", as: "movie"

  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"

  # get "movies/new" => "movies#new"
  get "movies/filter/:scope" => "movies#index", as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
