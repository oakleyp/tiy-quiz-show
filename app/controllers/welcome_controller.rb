class WelcomeController < ApplicationController
  before_action :require_no_open_submissions

  def index
    @complete_submissions = Submission.where({ complete: true })
                                      .sort_by {|submission| submission.correct.to_f/submission.possible.to_f} 
                                      .reverse
                                      .take(10)
  end
end
