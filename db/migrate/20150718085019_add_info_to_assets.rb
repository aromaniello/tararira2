class AddInfoToAssets < ActiveRecord::Migration
  def change
  	add_column :assets, :ticker, :string
	add_column :assets, :commercial_name, :string
  end
end
