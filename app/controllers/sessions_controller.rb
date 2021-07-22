class SessionsController < ApplicationController
	include SessionsHelper

	def login
		#login page
	end

  # SIGN IN
	def create
		user = User.find_by_email(params[:email].downcase)
		if user && user.authenticate(params[:password])
      sign_in(user)
      flash[:success] = "Welcome to the Admin Dashboard!"
      redirect_to :root
		else
			flash[:warning] = "Wrong credentials. Please try again."
			redirect_to :login
		end
	end

	# SIGN OUT
	def destroy
		sign_out
		flash[:success] = "See you soon!"
		redirect_to :root
	end
end
