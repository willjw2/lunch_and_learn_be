require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:recipe_link) }
    it { should validate_presence_of(:recipe_title) }
    it { should validate_presence_of(:user_id) }
  end
  describe 'relationships' do
    it { should belong_to(:user) }
  end
  describe 'class methods' do
    it '#user_favorites' do
      User.create!(name: "test", email: "testemail", api_key: "test_api_key")
      user = User.last

      User.create!(name: "test", email: "testemafesil", api_key: "test_api_key")
      user2 = User.last

      favorite1 = Favorite.create!(country: "Colombia", recipe_link: "Test_link.com", recipe_title: "Test_title", user_id: user.id)
      favorite2 = Favorite.create!(country: "China", recipe_link: "Test_link2.com", recipe_title: "Test_title2", user_id: user.id)

      favorite3 = Favorite.create!(country: "TEST", recipe_link: "Test_link3.com", recipe_title: "Test_title3", user_id: user2.id)

      favorites = Favorite.user_favorites(user.id)
      expect(favorites).to eq([favorite1, favorite2])
      expect(favorites).to_not include(favorite3)
    end
  end
end
