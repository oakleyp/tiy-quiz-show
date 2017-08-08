class SubmissionsController < ApplicationController
  before_action :require_user
  before_action :require_admin, only: [:show, :index]
  before_action :require_no_open_submissions, only: :create
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # New is implemented in quizzes#show method
  #def new
  #end

  # Should only be accessible if a user has not made a previous submission
  # with this quiz id and has no other quizzes open
  def create
    @submission = Submission.new(submission_params)
    @quiz = Quiz.find(@submission[:quiz_id])

    if(@quiz && @submission)
      qa_hash = json_to_hasharray(@quiz.qajson)
      @submission[:user_id] = current_user.id
      @submission[:qajson] = ''
      @submission[:complete] = false
      @submission[:correct] = 0
      @submission[:possible] = qa_hash.count if qa_hash

      if(@submission.save)
        render :edit
      else
        redirect_to user_path(current_user), notice: "Error creating new submission."
      end
    else
      redirect_to user_path(current_user), notice: "Invalid quiz ID."
    end
  end

  def edit
    @quiz = Quiz.find(@submission[:quiz_id])
    @qa_hash = json_to_hasharray(@quiz.qajson)
  end

  def update
  end

  def show
   @quiz = Quiz.find(@submission[:quiz_id])
   @qa_hash = json_to_hasharray(@quiz.qajson)
  end

  def destroy
  end

  def index
  end

  private

  def submission_params
    params.require(:submission).permit(:quiz_id, :qajson, :complete)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end
end
