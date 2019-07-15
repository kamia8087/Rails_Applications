class SessionsController < ApplicationController
  def new
    @user = User.new
  end

 def create
  @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to home_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to root_url
    end
 end 

 def destroy
  log_out
  redirect_to root_url
 end
end
