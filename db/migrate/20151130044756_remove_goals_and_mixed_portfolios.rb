class RemoveGoalsAndMixedPortfolios < ActiveRecord::Migration
    def change
        drop_table :goals
        drop_table :mixed_portfolios
        drop_table :mixed_portfolio_relationships
        drop_table :bank_account_histories
    end
end
