class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked(bookmark)
    likes.find_by(bookmark_id: bookmark.id)
  end

end
