class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :isbn
      t.timestamps null: false
    end
  end
end
