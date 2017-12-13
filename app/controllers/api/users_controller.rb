module API
	class UsersController < APIController
		before_filter :authenticate_user!, except: [:check_email_availability]

		def myself
			render json: current_user, root: false, status: 200
		end
		
		def check_email_availability
			if params[:email].nil?
				head 400
			elsif User.find_by(email: params[:email])
				head 403
			else
				head 200
			end
		end
		
		def check_user_authorized
			if current_user.authorized
				head 200
			else
				head 403
			end
		end
		
		def set_pin
			unless params[:new_pin] && params[:new_pin].length == 4
				head 400
			end

			if current_user.pin_hash.nil? # setting pin for the first time
				current_user.update(pin_hash: BCrypt::Password.create(params[:new_pin]))
				head 200
			elsif params[:old_pin] && current_user.check_pin(params[:old_pin]) # modifying pin
				current_user.update(pin_hash: BCrypt::Password.create(params[:new_pin]))
				head 200
			else
				head 401
			end
		end
		
		def check_pin
			if params[:pin].nil?
				head 400
			elsif params[:pin] && current_user.check_pin(params[:pin])
				head 200
			else
				head 401
			end
		end
		
		def check_password
			if params[:password].nil?
				head 400
			elsif current_user.valid_password?(params[:password])
				head 200
			else
				head 401
			end
		end

	end
end
