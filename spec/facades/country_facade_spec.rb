require 'rails_helper'

RSpec.describe CountryFacade do
  it '.all_countries' do
    countries = CountryFacade.all_countries
    expect(countries).to be_an(Array)
    # require "pry"; binding.pry
  end
  it '.random_country' do
    countries = CountryFacade.all_countries
    country = CountryFacade.random_country
    expect(country).to be_a(String)
    expect(countries.include?(country)).to eq(true)
  end
end
