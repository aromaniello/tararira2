class AddFieldsToUsers < ActiveRecord::Migration
  def change
	  change_table :users do |t|
		  t.string :first_name
		  t.string :last_name
		  t.date :date_of_birth
		  t.integer :gender, default: 0
		  t.string :address
		  t.string :city
		  t.string :province
		  t.string :country
		  t.string :zip_code
		  t.string :phone_number
		  t.string :tax_id
		  t.integer :employment_status, default: 0
	  end
  end
end
