require 'rails_helper'

RSpec.describe LearningResourceFacade do
  it '.learning_resource' do
    lr = LearningResourceFacade.learning_resources('Portugal')
    # require "pry"; binding.pry
    expect(lr).to be_an_instance_of(LearningResource)
  end
end
