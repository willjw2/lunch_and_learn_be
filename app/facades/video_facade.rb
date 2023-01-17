class VideoFacade
  def self.video(country)
    Video.new(VideoService.get_video(country))
  end
end
