class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.timestamp :checkouttime, null: false
      t.timestamp :pickuptime, null: true
      t.timestamp :expectedreturntime, null: false
      t.timestamp :returntime, null: true
      t.string :reservationstatus, default: "Reserved"
      
      t.references :user, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
