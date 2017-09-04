class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
  			sign_in user
  			flash[:success] = "Давно не виделись!"
  			redirect_back_or user
  		else
  			flash.now[:error] = "Введены некорректные данные!"
  			render :new
  		end
	end

	def destroy
		sign_out current_user
		redirect_to signin_path
	end

end
