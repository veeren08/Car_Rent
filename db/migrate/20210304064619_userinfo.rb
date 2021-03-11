class Userinfo < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dateofbirth, :date
    add_column :users, :mobile, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :zipcode, :integer
    add_column :users, :address, :string
  end
end
