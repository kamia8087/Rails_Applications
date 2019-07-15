class QuestionsController < ApplicationController
  before_action :logged_in_user
  def new_question
    @question = Question.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params);
    if @question.save
      redirect_to home_path
    else
      flash[:danger] = "Question not posted"
    end
  end

  def upvote
    @question = Question.find(params[:id])
    if @question.update_attributes(action: "Upvoted")
      redirect_to home_path
    else
      flash[:danger] = "Something went wrong while upvoting."
    end
  end

  def downvote
    @question = Question.find(params[:id])
    if @question.update_attributes(action: "Downvoted")
      redirect_to home_path
    else
      flash[:danger] = "Something went wrong while upvoting."
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
