module API
	class ActionsController < APIController
		before_action :authenticate_user!
		before_action :check_pin!

		def show
			action = current_user.actions.find(params[:id])
			render json: action, root: false, status: 200
		end

		def index
			actions = current_user.actions
			render json: actions, root: false, status: 200
		end

	end
end
