class CreatePendingItems < ActiveRecord::Migration
  def change
    create_table :pending_items do |t|
      t.string :isbn
      t.integer :user_id
      t.datetime :date_requested

      t.timestamps null: false
    end
  end
end
