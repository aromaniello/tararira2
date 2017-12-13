class RenamePendingRiskProfileFields < ActiveRecord::Migration
	def change
		rename_column :investment_accounts, :pending_risk_profile_change, :pending_risk_profile
		rename_column :investment_accounts, :risk_profile_change_sent_at, :pending_risk_profile_sent_at
	end
end
