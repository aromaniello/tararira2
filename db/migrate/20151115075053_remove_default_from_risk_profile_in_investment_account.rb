class RemoveDefaultFromRiskProfileInInvestmentAccount < ActiveRecord::Migration
	def change
		change_column_default :investment_accounts, :risk_profile, nil
	end
end
