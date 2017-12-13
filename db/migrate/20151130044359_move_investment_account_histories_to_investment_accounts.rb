class MoveInvestmentAccountHistoriesToInvestmentAccounts < ActiveRecord::Migration
    def change
        add_column :investment_account_histories, :investment_account_id, :integer
    end
end
