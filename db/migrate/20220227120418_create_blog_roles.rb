class CreateBlogRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_roles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
