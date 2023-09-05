class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:ingredient_id])
    recipe = Recipe.find(params[:id])
    recipe.ingredients.push(ingredient)

    redirect_to "/recipes/#{recipe.id}"
  end
end