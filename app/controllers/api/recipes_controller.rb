class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @recipe = Recipe.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    @recipe = Recipe.new(
      chef: params[:input_chef],
      title: params[:input_title],
      prep_time: params[:input_prep_time],
      ingredients: params[:input_ingredients],
      directions: params[:input_directions],
      image_url: params[:input_image_url]
    )
    @recipe.save
    render 'show.json.jb'
  end
end
