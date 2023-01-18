class Api::V1::FavoritesController < ApplicationController
  def create

    params[:user_id] = User.user_api_key(params[:api_key])

    if params[:user_id]
      Favorite.create!(favorite_params)
      render json: {"success": "Favorite added successfully"}, status: 201
    else
      render json: {"errors": "api_key is invalid"}, status: 400
    end

    # favorite = Favorite.new(favorite_params)
    # if User.valid_api_key?(params[:api_key]) && favorite.save
    #   render json: {"success": "Favorite added successfully"}
    # else
    #   render json: {"errors": "api_key is invalid or missing parameters"}, status: 400
    # end
  end

  def index
    user_id = User.user_api_key(params[:api_key])

    if user_id
      render json: FavoriteSerializer.new(Favorite.user_favorites(user_id))
    else
      render json: {"errors": "api_key is invalid"}, status: 400
    end
  end


private
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end
