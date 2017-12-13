class AddPinNumberToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :pin_number, :string
  end
end
