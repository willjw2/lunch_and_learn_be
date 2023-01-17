class Api::V1::UsersController < ApplicationController
  def create
    render json: UserSerializer.new(User.create!(user_params)), status: 201
  end
end
