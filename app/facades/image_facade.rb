class ImageFacade
  def self.images(country)
    ImageService.get_images(country).map do |image_data|
      Image.new(image_data)
    end
  end
end
