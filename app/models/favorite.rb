class Favorite < ApplicationRecord
  validates :country, presence: true
  validates :recipe_link, presence: true
  validates :recipe_title, presence: true
  validates :user_id, presence: true
  belongs_to :user

  def self.user_favorites(user_id)
    Favorite.where(user_id: user_id)
  end
end
