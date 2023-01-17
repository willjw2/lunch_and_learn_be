require 'rails_helper'

RSpec.describe RecipeFacade do
  it '.recipes' do
    recipes = RecipeFacade.recipes('Philippines')
    expect(recipes).to be_an Array
    expect(recipes[0]).to be_an_instance_of(Recipe)
  end
end
