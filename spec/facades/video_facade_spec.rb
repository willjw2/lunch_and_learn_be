require 'rails_helper'

RSpec.describe VideoFacade do
  it '.video' do
    video = VideoFacade.video('Portugal')
    expect(video).to be_an_instance_of(Video)
  end
end
