class AddTransactionsSinceLastUpdateToInvestmentAccounts < ActiveRecord::Migration
    def change
        add_column :investment_accounts, :transactions_since_last_update, :decimal, default: 0
    end
end
