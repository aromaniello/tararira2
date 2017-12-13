class AddAttachmentSignatureToUsers < ActiveRecord::Migration
	def self.up
		change_table :users do |t|
			t.attachment :signature
		end
	end

	def self.down
		remove_attachment :users, :signature
	end
end
