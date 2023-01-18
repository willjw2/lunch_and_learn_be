require 'rails_helper'

RSpec.describe 'Get Country Learning Resources' do
  it 'returns a country\'s learning resources as json', :vcr do
      country = "Colombia"

      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body,symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_a(Hash)

      lr = parsed_response[:data]

      expect(lr).to have_key(:id)
      expect(lr).to have_key(:type)
      expect(lr).to have_key(:attributes)
      expect(lr[:attributes]).to have_key(:country)
      expect(lr[:attributes]).to have_key(:video)
      expect(lr[:attributes][:video]).to have_key(:title)
      expect(lr[:attributes][:video]).to have_key(:youtube_video_id)
      expect(lr[:attributes]).to have_key(:images)
      expect(lr[:attributes][:images]).to be_an(Array)
      expect(lr[:attributes][:images].count).to eq(20)

      image_1 = lr[:attributes][:images][0]
      expect(image_1).to have_key(:alt_tag)
      expect(image_1).to have_key(:url)

      expect(lr[:attributes][:video]).to_not have_key(:thumbnails)
      expect(lr[:attributes][:video]).to_not have_key(:channelId)
  end
  it 'returns keys pointing to an empty object if no videos/images found', :vcr do
    country = "NameofCountry"

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    expect(parsed_response[:data][:attributes][:country]).to eq('NameofCountry')
    expect(parsed_response[:data][:attributes][:video]).to eq({})
    expect(parsed_response[:data][:attributes][:images]).to eq([])
  end
end
