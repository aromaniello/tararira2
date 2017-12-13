class CreatePortfolioAssetRelationships < ActiveRecord::Migration
  def change
    create_table :portfolio_asset_relationships do |t|
		t.belongs_to :portfolio, index: true
		t.belongs_to :asset, index: true
		
		t.float :weight

    	t.timestamps null: false
    end
  end
end
