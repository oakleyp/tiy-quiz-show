class UsersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_no_open_submissions
  before_action :set_quizzes, only: :show


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user[:role] = "user"
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    if @user && (current_user.id == @user.id)
      render 'admin_dash' if current_user.role == 'admin'
      render 'student_dash' if current_user.role == 'user'
    else
      redirect_to login_path, notice: "You do not have permission to view this page."
    end
  end

  def destroy
  end

  private

  def set_user
      @user = User.find(params[:id])
  end

  def set_quizzes
    if current_user && current_user.role == 'admin'
      @unpub_quizzes = Quiz.where({ user_id: current_user.id, published: false })
      @pub_quizzes = Quiz.where({ user_id: current_user.id, published: true })
      @complete_submissions = Submission.where({ complete: true })
    elsif current_user && current_user.role == 'user'
      @complete_submissions = Submission.where({ user_id: current_user.id, complete: true })
      set_available_quizzes
    end
  end

  def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def set_available_quizzes
    published_quizzes = Quiz.where({ published: true }).to_a
    @available_quizzes = published_quizzes
    published_quizzes.each_with_index do |quiz, index|
      @complete_submissions.each do |submission|
        if submission.quiz_id == quiz.id
          @available_quizzes.delete_at(index)
          break
        end
      end
    end
    
  end
end
