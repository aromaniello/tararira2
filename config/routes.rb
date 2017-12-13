Rails.application.routes.draw do

	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)

	#root to: ""
		
	#########
	## API ##
	#########

	mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: 'registrations' }
	
	get "/api/investment_accounts/own", to: "api/investment_accounts#show" # TODO: check naming
	put "/api/investment_accounts/own", to: "api/investment_accounts#update"
	get "/api/portfolios/current", to: "api/portfolios#current"
	get "/api/users/myself", to: "api/users#myself"

	get "/api/bank_accounts/active", to: "api/bank_accounts#show_active"
	put "/api/bank_accounts/active", to: "api/bank_accounts#update_active"
	post "/api/investment_accounts/risk_profile_recommendation", to: "api/investment_accounts#recommend_risk_profile"
	get "/api/investment_accounts/own/history", to: "api/investment_accounts#history"
	
	get "/api/portfolios/:risk_profile", to: "api/portfolios#show"
	get "/api/portfolios/:risk_profile/history", to: "api/portfolios#history"
	get "/api/portfolios/:risk_profile/history_old", to: "api/portfolios#history_old" # TODO: remove
	
	get "/api/static/cities", to: "api/static_data#cities"
	get "/api/static/banks", to: "api/static_data#banks"
	
	get "/users/reset_password", to: "users#reset_password_page"
	post "/users/reset_password", to: "users#reset_password"
	put "/api/users/set_pin", to: "api/users#set_pin"
	get "/api/users/check_pin", to: "api/users#check_pin"
	get "/api/users/check_email_availability", to: "api/users#check_email_availability"
	get "/api/users/check_user_authorized", to: "api/users#check_user_authorized"
	get "api/users/check_password", to: "api/users#check_password"
	get "/api/investment_accounts/own/check_available_funds", to: "api/investment_accounts#check_available_funds"
	
	namespace :api do
		resources :transactions, except: [:new, :edit]
		resources :bank_accounts, except: [:new, :edit]
		resources :portfolios, only: [:index]
		resources :actions, only: [:show, :index]
		resources :messages, only: [:create, :show, :index]
	end
	
	###
	
	put "/api/investment_accounts/own/daily_update", to: "api/investment_accounts#daily_update"
	put "/api/investment_accounts/daily_update", to: "api/investment_accounts#daily_update_all"
	put "/api/portfolios/daily_update", to: "api/portfolios#daily_update"

	###

	get "/users/confirmation_success", to: "users#confirmation_success"
	get "/users/confirmation_success_mobile", to: "users#confirmation_success_mobile"
	get "/users/confirmation_instructions", to: "users#confirmation_instructions"
	get "/users/email_with_form", to: "users#email_with_form"
	get "/users/show_pdf", to: "users#show_pdf"
	
end
