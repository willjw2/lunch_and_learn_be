require 'rails_helper'

RSpec.describe Recipe do
  it 'exists and has attributes' do
    properties = {
                    :label=>"Test Recipe",
                    :url=>"https://www.test.com/recipes",
                    :image=>"https://edamam-product-images.s3.amazonaws.com/web-img/test"
                  }
    country = 'China'
    recipe = Recipe.new(properties, country)

    expect(recipe).to be_an_instance_of(Recipe)
    expect(recipe.title).to eq("Test Recipe")
    expect(recipe.url).to eq("https://www.test.com/recipes")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/test")
    expect(recipe.country).to eq("China")
  end
end
