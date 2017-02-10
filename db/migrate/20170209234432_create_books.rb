class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string :title
      t.string :author
      t.string :publisher
      t.date :date_published
      t.text :description
      t.string :img_url
      t.string :status
      t.timestamps null: false
    end
  end
end
