class CreateLogs < ActiveRecord::Migration
	def change
		create_table :logs do |t|
			t.integer :log_type 		# enumeration (error, warning, exception, etc.)
			t.string :target 			# the object on which the error occurred
			t.string :description		# explanation about the error
			t.string :function			# function on which the error happened
			t.string :context			# values of variables at the time

			t.timestamps null: false
		end
	end
end
