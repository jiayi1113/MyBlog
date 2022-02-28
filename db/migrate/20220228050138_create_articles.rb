class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :state, default: true
      t.integer :blog_id

      t.timestamps
    end
  end
end
