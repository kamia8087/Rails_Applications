class UsersController < ApplicationController
  before_action :logged_in_user, except: [:create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'sessions/new'
    end
  end

  def home
    @user = current_user
    @questions = Question.search(params[:search])
    @answer = Answer.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
