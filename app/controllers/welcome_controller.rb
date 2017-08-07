class WelcomeController < ApplicationController
  def index
    @complete_submissions = Submission.where({ complete: true })
  end
end
