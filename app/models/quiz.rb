class Quiz < ApplicationRecord
  belongs_to :user

  #TODO: More validations
  validates :title, presence: true
  validates :qajson, presence: true
end
