class ChangeConfirmedInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :confirmed, :string, default: "pending"
  end
end
