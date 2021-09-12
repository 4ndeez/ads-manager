class Tag < ApplicationRecord
  has_many :taggings
  has_many :advertisements, through: :taggings

  validates :name, presence: true
end
