class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blog_roles, dependent: :delete_all
  has_many :blogs, through: :blog_roles
end
