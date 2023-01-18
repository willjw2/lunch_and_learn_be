require 'rails_helper'

RSpec.describe 'Add Favorites' do
  it 'Can add a favorite using a json payload in the body of the request' do
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json
    user = User.last
    user_api_key = user.api_key
    post "/api/v1/favorites", params: {"api_key": user_api_key, "country": "thailand", "recipe_link": "https://www.tastingtable.com", "recipe_title": "Crab Friend Rice 1"}, as: :json

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    expect(parsed_response).to eq({"success": "Favorite added successfully"})

    favorite = Favorite.last
    expect(favorite.country).to eq("thailand")
    expect(favorite.recipe_link).to eq("https://www.tastingtable.com")
    expect(favorite.recipe_title).to eq("Crab Friend Rice 1")
    expect(favorite.user_id).to eq(user.id)

  end
  it 'Will return appropriate error message if api_key is not valid' do
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json

    post "/api/v1/favorites", params: {"api_key": "WRONG_API_KEY", "country": "thailand", "recipe_link": "https://www.tastingtable.com", "recipe_title": "Crab Friend Rice 1"}, as: :json
    expect(response).to_not be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    expect(parsed_response).to eq({"errors": "api_key is invalid"})
  end
end
