class Blog < ApplicationRecord
  has_many :blog_roles, dependent: :delete_all
  has_many :users, through: :blog_roles
end
