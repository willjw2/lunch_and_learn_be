class LearningResourceFacade
  def self.learning_resources(country)
    LearningResource.new(country, VideoFacade.video(country), ImageFacade.images(country))
  end
end
