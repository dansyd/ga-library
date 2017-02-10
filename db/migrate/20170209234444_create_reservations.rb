class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :book_id
      t.integer :user_id
      t.date :date_requested
      t.date :date_borrowed
      t.date :date_due
      t.timestamps null: false
    end
  end
end
