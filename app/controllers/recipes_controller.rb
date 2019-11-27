class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
