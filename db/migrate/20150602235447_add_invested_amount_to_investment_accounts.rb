class AddInvestedAmountToInvestmentAccounts < ActiveRecord::Migration
  def change
  	add_column :investment_accounts, :invested_amount, :float, default: 0
  end
end
