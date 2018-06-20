class SessionsController < ApplicationController

	def new

	end

	def create
	      session[:search_results] = 
	      redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to "/"
	end

end
