class ApplicationController < ActionController::Base
	helper_method :getCurrentUser?
  protect_from_forgery
	before_filter :authorize

	def getCurrentUser?
		user = User.find_by_id(session[:user_id])
		if user == nil
			"guest"
		else
			 user.name
		end
	end

	protected
		def authorize
			unless User.find_by_id(session[:user_id])
			redirect_to login_url, notice: "Please log in" end
		end
end
