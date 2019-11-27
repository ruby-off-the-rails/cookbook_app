Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # index action. show all the recipes
    get '/recipes' => 'recipes#index'
    get '/recipes/:id' => 'recipes#show'
    post '/recipes' => 'recipes#create'
    patch '/recipes/:id' => 'recipes#update'
    delete '/recipes/:id' => 'recipes#destroy'

    # authentication
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end

  get "/recipes/new" => "recipes#new"
  get "/recipes/:id" => "recipes#show"
  get "/recipes" => "recipes#index"
  post "/recipes" => "recipes#create"
end

# RESTful
