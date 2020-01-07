require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    it 'should return an array of recipes' do
      # make some data for test db
      user = User.create!(name: "peter", email: "peter@email.com", password: "password")
      Recipe.create!(title: "example title 1", chef: "example chef", ingredients: "fdsfd", directions: "...", image_url: "...", prep_time: 100, user_id: user.id)
      Recipe.create!(title: "example title 2", chef: "example chef", ingredients: "fdsfd", directions: "...", image_url: "...", prep_time: 100, user_id: user.id)
      Recipe.create!(title: "example title 3", chef: "example chef", ingredients: "fdsfd", directions: "...", image_url: "...", prep_time: 100, user_id: user.id)

      get "/api/recipes"
      recipes = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipes.length).to eq(3)
    end
  end
  describe "POST /recipes" do
    it 'should create a new recipe in the database' do
      user = User.new(email: "bob@bob.com", password: "password", name: "robert")
      user.save
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        "random", # the secret key
        'HS256' # the encryption algorithm
      )
      post "/api/recipes", params: {
        chef: "brian",
        title: "hot chicken",
        ingredients: "spices, chicken",
        directions: "make the chicken hot",
        prep_time: 20
      }, headers: {"Authorization" => "Bearer #{jwt}"}

      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipe['chef']).to eq("brian")
    end
  end
end
