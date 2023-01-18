class Api::V1::UsersController < ApplicationController
  def create
    params[:api_key] = Array.new(16){[*"a".."z", *"0".."9"].sample}.join
    # require "pry"; binding.pry
    # render json: UserSerializer.new(User.create!(user_params, api_key: api_key)), status: 201
    # render json: UserSerializer.new(User.create!(user_params)), status: 201
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(User.last), status: 201
    else
      render json: {"errors": "unique email address must be used"}, status: 404
    end
  end
  

private
  def user_params
    # api_key = Array.new(16){[*"a".."z", *"0".."9"].sample}.join
    # params.permit(:name, :email, api_key: api_key)
    params.permit(:name, :email, :api_key)
  end
end
