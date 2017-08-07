class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :quiz_score
  helper_method :current_user

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def quiz_score
    scores = User.joins(submissions: :score).maximum( group: 'users.id')

    end
end
