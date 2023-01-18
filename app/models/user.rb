class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :api_key, presence: true
  has_many :favorites

  def self.user_api_key(api_key)
    if User.where(api_key: api_key).empty?
      return false
    else
      user = User.where(api_key: api_key)
      return user[0].id
    end
  end
end
