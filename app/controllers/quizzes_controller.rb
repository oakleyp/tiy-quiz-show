class QuizzesController < ApplicationController
  before_action :require_user
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def new
    @quiz = Quiz.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private 

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
