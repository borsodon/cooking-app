class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(recipe_params[:search], recipe_params[:page])
  end

  def show
    @recipe = Recipe.find(recipe_params[:id])
  end

  private

  def recipe_params
    params.permit(:id, :search, :page)
  end
end
