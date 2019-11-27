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
      user_id: 1
    )
    @recipe.save
    redirect_to "/recipes/#{@recipe.id}"
  end
end
