class VideoFacade
  def self.video(country)
    response = VideoService.get_video(country)
    if response
      Video.new(VideoService.get_video(country))
    else
      return {}
    end
  end
end
