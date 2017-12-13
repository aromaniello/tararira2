class RegistrationsController < DeviseTokenAuth::RegistrationsController
	
	private

	def sign_up_params
		params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :date_of_birth, :gender, :address, :city, :province, :country, :zip_code, :phone_number, :personal_id, :tax_id, :employment_status, :nationality, :spouse_first_name, :spouse_last_name, :spouse_gender, :spouse_date_of_birth, :spouse_nationality, :spouse_tax_id, :spouse_phone_number, :ready_for_processing, :question_1, :question_2, :question_3, :civil_status)
	end

	def account_update_params
		params.permit(:email, :first_name, :last_name, :date_of_birth, :gender, :address, :city, :province, :country, :zip_code, :phone_number, :personal_id, :tax_id, :employment_status, :nationality, :spouse_first_name, :spouse_last_name, :spouse_gender, :spouse_date_of_birth, :spouse_nationality, :spouse_tax_id, :spouse_phone_number, :ready_for_processing, :question_1, :question_2, :question_3, :civil_status)
	end
end
