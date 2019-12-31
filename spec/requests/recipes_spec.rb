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
end
