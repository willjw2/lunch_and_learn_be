require 'rails_helper'

RSpec.describe CountryService do
  it '.get_all_countries', :vcr do
    response = CountryService.get_all_countries
    expect(response).to be_an Array
    expect(response.first).to be_a(Hash)
    expect(response.first[:name]).to be_a(Hash)
    expect(response.first[:name]).to have_key :common
    expect(response.first[:name]).to have_key :official
  end
end
