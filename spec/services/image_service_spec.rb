require 'rails_helper'

RSpec.describe ImageService do
  it '.get_images' do
    response = ImageService.get_images('Germany')
    expect(response).to be_an Array
    expect(response.first).to be_a(Hash)
    expect(response.first).to have_key :alt_description
    expect(response.first[:urls]).to be_a(Hash)
    expect(response.first[:urls]).to have_key :regular
  end
end
