class AddReturnedToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :returned, :boolean
  end
end
