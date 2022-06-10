class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz

  def index
    @quizzes = Quiz.all
  end

  def show; end

  def new
    @quiz = Quiz.new.build_questions
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to quizzes_path
    else
      render :new
    end
  end

  def edit
    @questions = @quiz.questions
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

  def set_quiz
    @quiz ||= Quiz.find_by_id(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:id, :name, :_destroy])
  end

end
