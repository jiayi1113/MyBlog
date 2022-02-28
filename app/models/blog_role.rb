class BlogRole < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum role: {admin: 0, editor: 1, viewer: 2}
end
