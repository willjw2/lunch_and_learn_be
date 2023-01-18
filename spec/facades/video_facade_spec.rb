require 'rails_helper'

RSpec.describe VideoFacade do
  it '.video', :vcr do
    video = VideoFacade.video('Portugal')
    expect(video).to be_an_instance_of(Video)

    invalid_video = VideoFacade.video('ELSFBLEGKB')
    expect(invalid_video).to eq({})
  end
end
