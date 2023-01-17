require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes' do
    country = 'China'
    video = 'test video'
    images = ['images']

    learning_resource = LearningResource.new(country, video, images)

    expect(learning_resource).to be_an_instance_of(LearningResource)
    expect(learning_resource.country).to eq("China")
    expect(learning_resource.video).to eq("test video")
    expect(learning_resource.images).to eq(["images"])
  end
end
