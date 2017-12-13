ActiveAdmin.register User do

	menu priority: 1

	#show do
	#	attributes_table do
	#		row :id
	#		row :email
	#		row :first_name
	#		row :last_name
	#	end
	#	active_admin_comments
	#end

	index do
		id_column
		column :email
		column :first_name
		column :last_name
		column :created_at
		column :authorized
		actions
	end

	member_action :authorize_user, method: :put do # just 'authorize' creates a naming conflict
		if resource.authorized?
			redirect_to resource_path, notice: "User is already authorized."
		else
			if resource.authorize
				redirect_to resource_path, notice: "User successfully authorized."
				# add admin action
			else
				redirect_to resource_path, error: "User could not be authorized."
			end
		end
	end

	action_item :authorize_user, only: :show do
		link_to "Authorize", authorize_user_admin_user_path(user), method: :put
	end

	member_action :confirm_user, method: :put do
		if resource.confirmed?
			redirect_to resource_path, notice: "User is already confirmed."
		else
			if resource.confirm
				redirect_to resource_path, notice: "User successfully confirmed."
				# add admin action
			else
				redirect_to resource_path, error: "User could not be confirmed."
			end
		end
	end

	action_item :confirm_user, only: :show do
		link_to "Confirm", confirm_user_admin_user_path(user), method: :put
	end

	member_action :send_registration_form, method: :post do
		UserMailer.send_form(resource).deliver_now
		# add admin action
		redirect_to resource_path, notice: "Registration form sent."
	end

	action_item :send_registration_form, only: :show do
		link_to "Send Registration Form", send_registration_form_admin_user_path(user), method: :post
	end

	member_action :trigger_daily_update, method: :post do # put?
		resource.investment_account.daily_update
		# add admin action
		redirect_to resource_path, notice: "Daily update run."
	end

	action_item :trigger_daily_update, only: :show do
		link_to "Trigger Daily Update", trigger_daily_update_admin_user_path(user), method: :post
	end

	filter :email
	filter :first_name
	filter :last_name
	filter :gender
	filter :province
	filter :country
	filter :employment_status
	filter :nationality
	filter :civil_status
	# confirmed

	filter :pending_authorization
	filter :authorized

end
