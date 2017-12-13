class UsersController < ApplicationController
	
	layout false

	def reset_password_page
		@user = User.find_by(uid: params[:uid])
		@uid = params[:uid]
		@token = params[:token]
		
		if @user
			render layout: false
		else
			head 404
		end
	end

	def reset_password
		@user = User.find_by(uid: params[:uid])
		if @user.reset_password_token == params[:token] && @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
			@user.investment_account.actions.create(action_type: :change_password, action_date: Time.now)
			render layout: false
		else
			head 401
		end
	end
		
	def confirmation_success
	end

	def confirmation_success_mobile
		render "confirmation_success_mobile.html.erb"
	end

	def confirmation_instructions
		render "devise/mailer/confirmation_instructions.html.erb"
	end

end