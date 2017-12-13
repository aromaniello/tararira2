class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :first_name, :last_name, :date_of_birth, :gender, :address, :city, :province, :country, :zip_code, :phone_number, :personal_id, :tax_id, :employment_status, :nationality, :spouse_first_name, :spouse_last_name, :spouse_gender, :spouse_date_of_birth, :spouse_nationality, :spouse_tax_id, :spouse_phone_number, :question_1, :question_2, :question_3, :question_4, :civil_status, :pending_authorization, :authorized, :welcome_shown
end
