ActiveAdmin.register Transaction do

	menu priority: 3

	member_action :approve, method: :put do
		if resource.approved?
			redirect_to resource_path, notice: "Transaction is already approved."
		else
			if resource.approve
				redirect_to resource_path, notice: "Transaction successfully approved."
				# add admin action
			else
				redirect_to resource_path, error: "Transaction could not be approved."
			end
		end
	end

	action_item :approve, only: :show do
		link_to "Approve", approve_admin_transaction_path(transaction), method: :put
	end

	filter :transaction_type, as: :select, collection: proc { Transaction.transaction_types.keys }
	filter :created_at
	filter :credited_at
	filter :amount
	filter :approved
	filter :processed

end
