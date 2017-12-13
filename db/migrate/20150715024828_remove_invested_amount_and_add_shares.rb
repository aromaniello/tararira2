class RemoveInvestedAmountAndAddShares < ActiveRecord::Migration
  def change
  	remove_column :investment_accounts, :invested_amount, :float
	add_column :investment_accounts, :shares, :integer
  end
end
