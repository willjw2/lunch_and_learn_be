class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceSerializer.new(LearningResourceFacade.learning_resources(params[:country]))
  end
end
