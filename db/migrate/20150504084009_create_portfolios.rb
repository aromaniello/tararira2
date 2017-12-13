class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
		t.float :current_value, default: 0
		t.integer :risk_profile, default: 3

    	t.timestamps null: false
    end
  end
end
