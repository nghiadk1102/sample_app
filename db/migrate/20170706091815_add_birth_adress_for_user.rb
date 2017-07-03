class AddBirthAdressForUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birth_day, :date
    add_column :users, :address, :string
    add_column :users, :phone, :varchar
  end
end
