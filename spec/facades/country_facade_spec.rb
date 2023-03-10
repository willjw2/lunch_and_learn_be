require 'rails_helper'

RSpec.describe CountryFacade do
  it '.all_countries', :vcr do
    countries = CountryFacade.all_countries
    expect(countries).to be_an(Array)
  end

  it '.random_country', :vcr do
    countries = CountryFacade.all_countries
    country = CountryFacade.random_country
    expect(country).to be_a(String)
    expect(countries.include?(country)).to eq(true)
  end
end
