class ApplicationController < ActionController::Base
	include Pundit

	protect_from_forgery with: :exception

	before_filter :prepare_for_mobile

	private

	def mobile_device?
		if session[:mobile_param]
			session[:mobile_param] == "1"
		else
			request.user_agent =~ /Mobile|webOS/
		end
	end
	helper_method :mobile_device?

	def prepare_for_mobile
		session[:mobile_param] = params[:mobile] if params[:mobile]
		request.format = :mobile if mobile_device?
	end
end
