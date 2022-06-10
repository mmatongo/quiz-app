class AnswersController < ApplicationController
  before_action :set_answer

  def new; end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.questions.each do |question|
        answer = question.answers.new do |a|
            a.response = answer_params[question.id.to_s]
            a.user = current_user.id
        end
        answer.save
    end
    redirect_to quiz_path(@quiz)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:response)
  end
end
