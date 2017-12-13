module API
	class InvestmentAccountsController < APIController
		before_action :authenticate_user!
		before_action :check_pin!
		
		def show
			investment_account = current_user.investment_account
			render json: investment_account, root: false, status: 200
		end
		
		def update # only risk profile can be changed
			investment_account = current_user.investment_account
			new_risk_profile = investment_account_params[:risk_profile].to_i

			if !(InvestmentAccount.valid_risk_profiles.push(nil).include?(new_risk_profile))
				head 422

				render json: investment_account, root: false, status: 200

			elsif investment_account.risk_profile == new_risk_profile # if same as current, do nothing

				render json: investment_account, root: false, status: 200

			else # risk profile is different, make the change pending for the daily update to process
				
				if investment_account.update(pending_risk_profile_change: new_risk_profile, risk_profile_change_sent_at: Time.now)
					investment_account.user.actions.create(action_type: :change_risk_profile, value: new_risk_profile, action_date: Time.now, status: "pending")
					render json: investment_account, root: false, status: 200
				else
					head 400
				end
			end
		end
		
		def recommend_risk_profile
			answers = [params[:answer_1].to_i, params[:answer_2].to_i, params[:answer_3].to_i, params[:answer_4].to_i, params[:answer_5].to_i, params[:answer_6].to_i, params[:answer_7].to_i, params[:answer_8].to_i]
			
			if result = InvestmentAccount.recommend_risk_profile(answers)
				render json: { risk_profile: result }.to_json, status: 200
			else
				head 404
			end
		end
		
		def check_available_funds
			if params[:amount].nil?
				head 400
			elsif current_user.investment_account.enough_for_refund?(params[:amount].to_d)
				head 200
			else
				head 403
			end
		end
		
		def history
			if history = current_user.investment_account_histories.order("created_at ASC")
				render json: history, status: 200
			else
				head 404
			end
		end
		
		# runs the daily update for the user's investment account
		def daily_update
			current_user.investment_account.daily_update
			render json: current_user, status: 200
		end
		
		def daily_update_all
			InvestmentAccount.daily_update
		end
		
		private
			def investment_account_params
				params.permit(:risk_profile)
			end
	end
end