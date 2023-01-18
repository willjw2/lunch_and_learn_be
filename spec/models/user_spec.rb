require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:api_key) }
    it { should validate_uniqueness_of(:email) }
  end
  describe 'relationships' do
    it { should have_many(:favorites) }
  end
  describe 'class methods' do
    it '#user_api_key' do
      User.create!(name: "test", email: "testemail", api_key: "test_api_key")
      user = User.last

      expect(User.user_api_key("test_api_key")).to eq(user.id)
      expect(User.user_api_key("not_a_valid_key")).to eq(false)
    end
  end
end
