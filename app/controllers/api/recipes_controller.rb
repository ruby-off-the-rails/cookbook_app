class Api::RecipesController < ApplicationController
  def first_recipe
    # how do i get the data from the db?
    @recipe = Recipe.first
    render 'recipe.json.jb'
  end
end
