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
    # update action. updates a currently existing recipe in the db
    patch '/recipes/:id' => 'recipes#update'
    # destroy action. deletes a recipe from the db
    delete '/recipes/:id' => 'recipes#destroy'
  end
end

# RESTful
