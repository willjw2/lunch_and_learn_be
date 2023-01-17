class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      render json: RecipeSerializer.new(RecipeFacade.recipes(params[:country]))
    else
      country = CountryFacade.random_country
      render json: RecipeSerializer.new(RecipeFacade.recipes(country))
    end
  end
end
