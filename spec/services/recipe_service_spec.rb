require 'rails_helper'

RSpec.describe RecipeService do
  it '.get_recipes' do
    response = RecipeService.get_recipes('Germany')
    # require "pry"; binding.pry
    expect(response).to be_an Array
    expect(response.first).to be_a(Hash)
    expect(response.first[:recipe]).to be_a(Hash)
    expect(response.first[:recipe]).to have_key :label
    expect(response.first[:recipe]).to have_key :image
    expect(response.first[:recipe]).to have_key :url
  end
end
