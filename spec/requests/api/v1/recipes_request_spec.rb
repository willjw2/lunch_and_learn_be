require 'rails_helper'

RSpec.describe 'Get Country Recipes' do
  it 'returns a country\'s recipes as json' do
      country = "Spain"

      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body,symbolize_names: true)

      # require "pry"; binding.pry
      expect(parsed_response).to be_a(Hash)
      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_an(Array)

      recipe = parsed_response[:data][0]

      expect(recipe).to have_key(:id)
      expect(recipe).to have_key(:type)
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes]).to have_key(:image)

      expect(recipe[:attributes]).to_not have_key(:images)
      expect(recipe[:attributes]).to_not have_key(:source)
      expect(recipe[:attributes]).to_not have_key(:dietLabels)
      expect(recipe[:attributes]).to_not have_key(:ingredients)
  end
  it 'returns a random country\'s recipes as json' do
    allow(CountryFacade).to receive(:random_country).and_return('Thailand')
    get "/api/v1/recipes"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)

    recipe = parsed_response[:data][0]

    expect(recipe[:attributes][:country]).to eq('Thailand')
  end
end
