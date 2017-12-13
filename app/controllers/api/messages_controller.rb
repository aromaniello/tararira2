module API
	class MessagesController < APIController
		before_action :authenticate_user!
		
		def create
			message = current_user.messages.build(message_params)
			
			if message.save
				render json: message, root: false, status: 201, location: api_message_url(message)
			else
				render json: message.errors, root: false, status: 422
			end
		end
		
		def show
			message = current_user.messages.find(params[:id])
			
			if message
				render json: message, root: false, status: 200
			else
				head 404
			end
		end
		
		def index
			messages = current_user.messages
			
			if messages
				render json: messages, root: false, status: 200
			else
				head 404
			end
		end
		
		private
			def message_params
				params.permit(:subject, :body)
			end
	
	end
end