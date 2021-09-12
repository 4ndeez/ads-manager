class Advertisement < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true

  def self.tagged_with(name)
    Tag.find_by!(name: name).advertisements
  end

  def tag_list
    tags.map(&:name)
  end
end
