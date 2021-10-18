class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.search(ingredient_params[:search], ingredient_params[:page])
  end

  def show
    @ingredient = Ingredient.find(ingredient_params[:id])
  end

  private

  def ingredient_params
    params.permit(:id, :search, :page)
  end
end
