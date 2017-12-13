module API
	class APIController < ActionController::Base
		include DeviseTokenAuth::Concerns::SetUserByToken

		protect_from_forgery with: :null_session
		
		before_action :check_app_token
		
		private
			
		def check_pin!
			head 401 unless current_user.check_pin(request.headers['Pin-Number'])
		end
		
		def check_app_token
			app_token = request.headers['App-Token']
			
			if app_token
				puts "App Token Present: #{app_token}"
			else
				puts "App Token Not Present"
			end
		end
	end
end
