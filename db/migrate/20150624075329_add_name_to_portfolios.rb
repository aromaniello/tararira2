class AddNameToPortfolios < ActiveRecord::Migration
  def change
  	add_column :portfolios, :name, :string, default: ""
  end
end
