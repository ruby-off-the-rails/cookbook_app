class Api::RecipesController < ApplicationController
  def index
    # if current_user
    #   @recipes = current_user.recipes
    #   render 'index.json.jb'
    # else
    #   render json: []
    # end
    @recipes = Recipe.all
    render 'index.json.jb'
    # @recipes = Recipe.where("title LIKE ?", "%#{params[:search]}%")
    # @recipes = @recipes.where("id > 5")
    # @recipes.order!(:prep_time => :asc)
  end

  def show
    the_id = params[:id]
    @recipe = Recipe.find_by(id: the_id)
    render 'show.json.jb'
    # render 'show.html.erb'
  end

  def create
    @recipe = Recipe.new(
      chef: params[:input_chef],
      title: params[:input_title],
      prep_time: params[:input_prep_time],
      ingredients: params[:input_ingredients],
      directions: params[:input_directions],
      image_url: params[:input_image_url],
      user_id: current_user.id
    )
    @recipe.save
    # p "*" * 50
    # p @recipe.errors.full_messages
    # p "*" * 50
    render 'show.json.jb'
  end

  def update
    # combination of the show and create, kind of
    # first find the correct recipe
    the_id = params[:id]
    @recipe = Recipe.find_by(id: the_id)
    # change the attributes of the recipe based on the params
    @recipe.title = params[:input_title] || @recipe.title
    @recipe.chef = params[:input_chef] || @recipe.chef
    @recipe.ingredients = params[:input_ingredients] || @recipe.ingredients
    @recipe.directions = params[:input_directions] || @recipe.directions
    @recipe.prep_time = params[:input_prep_time] || @recipe.prep_time
    @recipe.image_url = params[:input_image_url] || @recipe.image_url
    @recipe.save
    render 'show.json.jb'
  end

  def destroy
    # find the recipe
    @recipe = Recipe.find_by(id: params[:id])
    # destroy the recipe
    @recipe.destroy
    render 'destroy.json.jb'
  end
end
