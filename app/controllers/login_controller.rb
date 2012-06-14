class LoginController < ApplicationController
  def index
  end
  
  def login
    user = User.find_by_name(params[:user][:name])
	
	if user
	  session[:user] = user
	  redirect_to :controller => 'actual_working_times'
	else
      render 'index'	
	end
  end
end
