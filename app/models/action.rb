class Action < ActiveRecord::Base
	enum action_type: [:change_risk_profile, :change_password]
	
	belongs_to :user
end
