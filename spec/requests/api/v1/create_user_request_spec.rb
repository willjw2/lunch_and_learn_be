require 'rails_helper'

RSpec.describe 'Create New User' do
  it 'Can create a new user using a json payload in the body of the request' do
    # params = {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}
    # require "pry"; binding.pry
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    user = User.last
    expect(user.name).to eq("Athena Dao")
    expect(user.email).to eq("athenadao@bestgirlever.com")
    # require "pry"; binding.pry
  end
  it 'Will return appropriate error message if email is not unique' do
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json
    expect(response).to be_successful

    post "/api/v1/users", params: {"name": "Athena Dao2", "email": "athenadao@bestgirlever.com"}, as: :json
    expect(response).to_not be_successful

    parsed_response = JSON.parse(response.body,symbolize_names: true)
    expect(parsed_response).to eq({:errors=>"unique email address must be used"})
    # require "pry"; binding.pry
  end
end
