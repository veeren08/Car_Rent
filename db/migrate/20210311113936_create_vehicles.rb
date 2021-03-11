class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :license
      t.string :PlateNumber
      t.string :manufacturer
      t.string :model
      t.float :hourlyRentalRate
      t.string :style
      t.string :status
      t.string :city
      t.string :state
      t.string :country
      t.string :mobile
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
