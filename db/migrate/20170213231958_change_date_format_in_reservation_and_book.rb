class ChangeDateFormatInReservationAndBook < ActiveRecord::Migration
  def change
    change_column :reservations, :date_requested, :datetime
    change_column :reservations, :date_borrowed, :datetime
    change_column :books, :date_published, :string
  end
end
