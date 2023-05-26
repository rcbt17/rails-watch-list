class ListComment < ApplicationRecord
  belongs_to :list
  validates :content, presence: true, length: { minimum: 15 }
end
