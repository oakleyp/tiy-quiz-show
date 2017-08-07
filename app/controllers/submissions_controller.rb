class SubmissionsController < ApplicationController
  attr_accessible :contest_id, :description, :title, :user_id, :video, :image_attributes, :comment_show
  default_scope order: 'submissions.created_at DESC'
  belongs_to :user
  has_one :score, :dependent => :destroy

  def new
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

  def index
  end
end
