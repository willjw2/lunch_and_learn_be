require 'rails_helper'

RSpec.describe 'Get User Favorites' do
  it 'Can get user favorites as a json response' do
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json
    user1 = User.last
    post "/api/v1/users", params: {"name": "Will Wang", "email": "test@gmail.com"}, as: :json
    user2 = User.last

    post "/api/v1/favorites", params: {"api_key": user1.api_key, "country": "thailand", "recipe_link": "https://www.tastingtable.com", "recipe_title": "Crab Friend Rice 1"}, as: :json
    fav1 = Favorite.last
    post "/api/v1/favorites", params: {"api_key": user1.api_key, "country": "china", "recipe_link": "https://www.test1.com", "recipe_title": "Test Recipe"}, as: :json
    fav2 = Favorite.last

    post "/api/v1/favorites", params: {"api_key": user2.api_key, "country": "portugal", "recipe_link": "https://www.test2.com", "recipe_title": "Test 2"}, as: :json
    fav3 = Favorite.last

    get "/api/v1/favorites?api_key=#{user1.api_key}"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)

    expect(parsed_response[:data].count).to eq(2)
    expect(parsed_response[:data][0][:id].to_i).to eq(fav1.id)
    expect(parsed_response[:data][1][:id].to_i).to eq(fav2.id)
  end

  it 'Will return appropriate error message if api_key is not valid' do
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json

    get "/api/v1/favorites?api_key=INVALID_API_KEY"
    expect(response).to_not be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    expect(parsed_response).to eq({"errors": "api_key is invalid"})
  end

  it 'Will return an empty array if user has not favorited any recipes' do
    post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json
    user1 = User.last
    get "/api/v1/favorites?api_key=#{user1.api_key}"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    expect(parsed_response[:data]).to eq([])
  end
end
