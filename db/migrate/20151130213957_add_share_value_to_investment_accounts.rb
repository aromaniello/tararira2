class AddShareValueToInvestmentAccounts < ActiveRecord::Migration
    def change
        add_column :investment_accounts, :share_value, :decimal, default: 0
    end
end
