ActiveAdmin.register InvestmentAccount do

	menu priority: 2

	index do
		selectable_column
		column :user do |investment_account|
			link_to investment_account.user.email, admin_user_path(investment_account.user)
		end
		column :risk_profile
		column :shares
		column :share_value
		column :account_value
		column :last_update
		column :pending_risk_profile
		actions
	end

	member_action :seed_random_history, method: :post do
		Randomizer.seed_investment_account_history!(resource)
		# add admin action
		redirect_to resource_path, notice: "Investment account history randomized."
	end

	action_item :seed_random_history, only: :show do
		link_to "Seed Random History", seed_random_history_admin_investment_account_path(investment_account), method: :post
	end

	filter :risk_profile
	filter :pending_risk_profile
	filter :last_update
	filter :updates_disabled
end
