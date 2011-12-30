class ApplicationController < ActionController::Base
	helper_method :getCurrentUser?
	helper_method :isLoggedIn?
  protect_from_forgery
	before_filter :authorize

	def getCurrentUser?
		user = User.find_by_id(session[:user_id])
		if user.nil?
			"Guest"
		else
			 user.name
		end
	end

	def isLoggedIn?
		if session[:user_id].nil?
			return true
		end
		return false
	end

	protected
		def authorize
			unless User.find_by_id(session[:user_id])
			redirect_to login_url, notice: "Please log in" end
		end
end
