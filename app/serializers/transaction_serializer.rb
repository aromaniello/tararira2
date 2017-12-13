class TransactionSerializer < ActiveModel::Serializer
	attributes :id, :transaction_type, :amount, :credited_at, :status

	def status
		if object.approved
			"approved"
		elsif object.processed
			"credited"
		else
			"pending"
		end
	end
end
