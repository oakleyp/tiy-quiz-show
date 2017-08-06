class QuizzesController < ApplicationController
  before_action :require_user
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :publish]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz[:user_id] = current_user.id
    @quiz[:published] = false

    if @quiz.save
      redirect_to quiz_path(@quiz), notice: 'Quiz was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz), notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @quiz.destroy
    redirect_to user_path(current_user), notice: 'Quiz was deleted.'
  end

  def publish
    @quiz.published = true
    @quiz.save
    redirect_to user_path(current_user), notice: 'Quiz has been published and is now accessible by all users.'
  end

  private 

  def quiz_params
    params.require(:quiz).permit(:title, :qajson)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
