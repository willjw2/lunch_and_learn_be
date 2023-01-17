require 'rails_helper'

RSpec.describe VideoService do
  it '.get_video' do
    response = VideoService.get_video('Colombia')
    expect(response).to be_a Hash
    expect(response).to have_key :id
    expect(response[:id]).to have_key :videoId
    expect(response).to have_key :snippet
    expect(response[:snippet]).to have_key :title
  end
end
