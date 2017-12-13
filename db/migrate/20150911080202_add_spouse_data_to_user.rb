class AddSpouseDataToUser < ActiveRecord::Migration
	def change
		add_column :users, :spouse_first_name, :string
		add_column :users, :spouse_last_name, :string
		add_column :users, :spouse_gender, :integer
		add_column :users, :spouse_date_of_birth, :date
		add_column :users, :spouse_nationality, :string
		add_column :users, :spouse_tax_id, :string
		add_column :users, :spouse_phone_number, :string
		
		add_column :users, :nationality, :string
	end
end
