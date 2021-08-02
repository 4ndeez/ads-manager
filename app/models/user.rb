class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enumerize :role, in: [:user, :admin], default: :user

  validates :first_name, :last_name,
            format: { with: /\A[a-zA-Z]+\z/, allow_blank: true, message: "only allows letters" }
end
