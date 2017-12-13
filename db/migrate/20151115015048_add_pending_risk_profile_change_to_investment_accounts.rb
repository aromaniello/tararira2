class AddPendingRiskProfileChangeToInvestmentAccounts < ActiveRecord::Migration
	def change
		add_column :investment_accounts, :pending_risk_profile_change, :integer
		add_column :investment_accounts, :risk_profile_change_sent_at, :datetime
	end
end
