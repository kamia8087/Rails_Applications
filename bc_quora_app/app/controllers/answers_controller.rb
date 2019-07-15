class AnswersController < ApplicationController
  before_action :logged_in_user
  def new
    @answer = Answer.new
  end

  def index
    @answers = Answer.where(user_id: current_user.id)
  end

  def create
    @question = Question.find(params[:answer][:question_id])
    @answer = current_user.answers.build(answer_params);
    @answer.question_id = @question.id
    if @answer.save
      redirect_to home_path
    else
      flash[:danger] = "Answer not posted"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
