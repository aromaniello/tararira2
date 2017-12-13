class AddSubtypeToAssets < ActiveRecord::Migration
  def change
  	add_column :assets, :asset_subtype, :integer, default: 0
  end
end
