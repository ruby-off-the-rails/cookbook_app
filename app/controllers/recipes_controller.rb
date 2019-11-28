class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def index
    @recipes = Recipe.all
    render 'index.html.erb'
  end

  def new
    @users = User.all
    render 'new.html.erb'
  end

  def create
    @recipe = Recipe.new(
      chef: params[:chef],
      title: params[:title],
      prep_time: params[:prep_time],
      ingredients: params[:ingredients],
      directions: params[:directions],
      image_url: params[:image_url],
      user_id: params[:user_id]
    )
    @recipe.save
    redirect_to "/recipes/#{@recipe.id}"
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.title = params[:title]
    @recipe.directions = params[:directions]
    @recipe.prep_time = params[:prep_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.image_url = params[:image_url]
    @recipe.save
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to "/recipes"
  end
end
