class AddAttachmentsToUsers < ActiveRecord::Migration
	def change
		add_attachment :users, :photo_personal_id_front
		add_attachment :users, :photo_personal_id_back
		add_attachment :users, :photo_personal_id_selfie
	end
end
