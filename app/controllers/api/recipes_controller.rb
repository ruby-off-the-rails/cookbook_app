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

  def update
    # combination of the show and create, kind of
    # first find the correct recipe
    the_id = params[:id]
    @recipe = Recipe.find_by(id: the_id)
    # change the attributes of the recipe based on the params
    @recipe.title = params[:input_title]
    @recipe.chef = params[:input_chef]
    @recipe.ingredients = params[:input_ingredients]
    @recipe.directions = params[:input_directions]
    @recipe.prep_time = params[:input_prep_time]
    @recipe.image_url = params[:input_image_url]
    @recipe.save
    render 'show.json.jb'
  end
end
