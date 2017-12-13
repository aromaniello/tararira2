class RemovePreviousVersionIdFromPortfolios < ActiveRecord::Migration
	def change
		remove_column :portfolios, :previous_version_id, :integer
	end
end
