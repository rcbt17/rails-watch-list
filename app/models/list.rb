class List < ApplicationRecord
  has_one_attached :poster_img
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :comment, presence: true, length: { minimum: 10 }
  validates :poster_img, presence: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :list_comments, dependent: :destroy
end
