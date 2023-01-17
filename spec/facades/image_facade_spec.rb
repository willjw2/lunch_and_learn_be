require 'rails_helper'

RSpec.describe ImageFacade do
  it '.images' do
    images = ImageFacade.images('Philippines')
    expect(images).to be_an Array
    expect(images[0]).to be_an_instance_of(Image)
  end
end
