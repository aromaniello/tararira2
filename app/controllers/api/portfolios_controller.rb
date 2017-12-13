module API
	class PortfoliosController < APIController
		before_action :authenticate_user!, only: [:current]
		before_action :check_pin!, only: [:current]
		
		def show
			if portfolio = Portfolio.find_by(risk_profile: params[:risk_profile].to_i)
				render json: portfolio, root: false, status: 200
			else
				head 404
			end
		end
		
		def index
			if portfolios = Portfolio.all
				render json: portfolios, root: false, status: 200
			else
				head 404
			end
		end
		
		def current
			portfolio = Portfolio.where("risk_profile = ?", current_user.investment_account.risk_profile).first
			render json: portfolio, root: false, status: 200
		end
		
		def history
			risk_profile = params[:risk_profile].to_i
			if risk_profile
				render json: PortfolioHistory.history_by_period(risk_profile), root: false, status: 200
			else
				head 404
			end
		end
		
		def daily_update
			Portfolio.daily_update
		end
	end
end
