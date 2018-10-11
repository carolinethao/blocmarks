class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookmarks, dependent: :destroy
  validates :title, length: { minimum: 1 }, format: { with: /\A[a-zA-Z]+\z/ }
end
