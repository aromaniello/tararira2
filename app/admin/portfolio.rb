ActiveAdmin.register Portfolio do
	menu priority: 4

	permit_params :ticker, :name, :shares, :updates_disabled, :update_pending, :next_share_value

	index do
		selectable_column
		column :risk_profile
		column :ticker
		column :name
		column :share_value
		column :shares
		column :last_update
		column :updates_disabled
		actions
	end
end
