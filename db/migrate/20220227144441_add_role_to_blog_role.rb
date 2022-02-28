class AddRoleToBlogRole < ActiveRecord::Migration[6.1]
  def change
    add_column :blog_roles, :role, :integer
  end
end
