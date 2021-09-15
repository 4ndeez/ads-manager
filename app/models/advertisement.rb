class Advertisement < ApplicationRecord
  include AASM
  aasm column: 'state' do
    state :drafted, initial: true
    state :new
    state :declined
    state :approved
    state :published
    state :archived

    event :draft do
      transitions from: [:new, :declined, :archived], to: :drafted
    end

    event :ready do # idk
      transitions from: [:drafted], to: :new
    end

    event :decline do
      transitions from: [:new], to: :declined
    end

    event :approve do
      transitions from: [:new], to: :approved
    end

    event :publish do
      transitions from: [:approved], to: :published
    end

    event :archive do
      transitions from: [:published], to: :archived
    end
  end

  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many_attached :images

  validates :name, presence: true

  def self.tagged_with(name)
    Tag.find_by!(name: name).advertisements
  end

  def tag_list
    tags.map(&:name)
  end
end
