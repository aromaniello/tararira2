class InvestmentAccountSerializer < ActiveModel::Serializer
	attributes :id, :risk_profile, :shares, :current_value, :winloss_amount, :return_on_investment, :account_value, :last_variation, :last_variation_percentage

	def risk_profile
		if object.risk_profile.nil?
			if object.pending_risk_profile_change.nil?
				3 # pending
			else
				object.pending_risk_profile_change
			end
		else
			object.risk_profile
		end
	end

	def winloss_amount
		object.last_variation
	end
	
	def return_on_investment
		object.last_variation_percentage
	end
	
	def current_value
		object.account_value
	end
end
