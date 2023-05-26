class List < ApplicationRecord
  has_one_attached :poster_img
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :comment, presence: true, length: { minimum: 10 }
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
end
