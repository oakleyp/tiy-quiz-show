class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
 
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
 
  def require_user
    redirect_to '/login' unless current_user
  end

  def require_admin
    if !current_user || current_user.role != "admin"
      redirect_to '/login', notice: "You must be an administrator to access this page."
    end
  end

  def require_no_open_submissions
    require_user
    #Hopefully there can only ever be one open submission
    @open_submission = Submission.where({  user_id: current_user.id, complete: false }).first
    redirect_to edit_submission_path(@open_submission) if @open_submission
  end

  def json_to_hasharray(jsonstr)
    JSON.parse(jsonstr)
  end
end
