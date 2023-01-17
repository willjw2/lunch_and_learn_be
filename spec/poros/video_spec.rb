require 'rails_helper'

RSpec.describe Video do
  it 'exists and has attributes' do
    attributes = {
                    :snippet=>{:title => "Test Video"},
                    :id=>{:videoId => "video_id"}
                  }
    video = Video.new(attributes)

    expect(video).to be_an_instance_of(Video)
    expect(video.title).to eq("Test Video")
    expect(video.youtube_video_id).to eq("video_id")
  end
end
