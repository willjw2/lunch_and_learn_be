require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attributes' do
    properties = {
                    :alt_description=>"alt_description",
                    :urls=>{:regular => "https://www.test.com/recipes"}
                  }

    image = Image.new(properties)

    expect(image).to be_an_instance_of(Image)
    expect(image.alt_tag).to eq("alt_description")
    expect(image.url).to eq("https://www.test.com/recipes")
  end
end
