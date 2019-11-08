Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # index action. show all the recipes
    get '/recipes' => 'recipes#index'
    # show action. show one particular recipe
    get '/recipes/:id' => 'recipes#show'
    # create action. makes a new recipe in the db
    post '/recipes' => 'recipes#create'
  end
end

# RESTful
