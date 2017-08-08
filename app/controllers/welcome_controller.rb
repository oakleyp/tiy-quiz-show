class WelcomeController < ApplicationController
  #before_action :require_no_open_submissions

  def index
    @complete_submissions = Submission.where({ complete: true })
  end
end
