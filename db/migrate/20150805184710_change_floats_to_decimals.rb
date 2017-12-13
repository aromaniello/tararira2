class ChangeFloatsToDecimals < ActiveRecord::Migration
	def up
		remove_column :investment_accounts, :shares
		add_column :investment_accounts, :shares, :decimal, precision: 30, scale: 10, default: 0
		
		remove_column :investment_account_histories, :shares
		remove_column :investment_account_histories, :share_value
		remove_column :investment_account_histories, :account_value
		add_column :investment_account_histories, :shares, :decimal, precision: 30, scale: 10, default: 0
		add_column :investment_account_histories, :share_value, :decimal, precision: 30, scale: 10, default: 0
		add_column :investment_account_histories, :account_value, :decimal, precision: 30, scale: 10, default: 0
		
		remove_column :portfolio_asset_relationships, :weight
		add_column :portfolio_asset_relationships, :weight, :decimal, precision: 30, scale: 10, default: 0
		
		remove_column :portfolios, :share_value
		remove_column :portfolios, :new_share_value
		remove_column :portfolios, :shares
		add_column :portfolios, :share_value, :decimal, precision: 30, scale: 10, default: 0
		add_column :portfolios, :new_share_value, :decimal, precision: 30, scale: 10, default: 0
		add_column :portfolios, :shares, :decimal, precision: 30, scale: 10, default: 0
		
		remove_column :portfolio_histories, :share_value
		remove_column :portfolio_histories, :shares
		add_column :portfolio_histories, :share_value, :decimal, precision: 30, scale: 10, default: 0
		add_column :portfolio_histories, :shares, :decimal, precision: 30, scale: 10, default: 0
		
		remove_column :transactions, :amount
		add_column :transactions, :amount, :decimal, precision: 30, scale: 10, default: 0
	end
	def down
		remove_column :investment_accounts, :shares
		add_column :investment_accounts, :shares, :float
		
		remove_column :investment_account_histories, :shares
		remove_column :investment_account_histories, :share_value
		remove_column :investment_account_histories, :account_value
		add_column :investment_account_histories, :shares, :float
		add_column :investment_account_histories, :share_value, :float
		add_column :investment_account_histories, :account_value, :float
		
		remove_column :portfolio_asset_relationships, :weight
		add_column :portfolio_asset_relationships, :weight, :float
		
		remove_column :portfolios, :share_value
		remove_column :portfolios, :new_share_value
		remove_column :portfolios, :shares
		add_column :portfolios, :share_value, :float
		add_column :portfolios, :new_share_value, :float
		add_column :portfolios, :shares, :float
		
		remove_column :portfolio_histories, :share_value
		remove_column :portfolio_histories, :shares
		add_column :portfolio_histories, :share_value, :float
		add_column :portfolio_histories, :shares, :float
		
		remove_column :transactions, :amount
		add_column :transactions, :amount, :float
	end
end
