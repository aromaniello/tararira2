class AddCreditedAtToTransactions < ActiveRecord::Migration
	def change
		add_column :transactions, :credited_at, :datetime
	end
end
