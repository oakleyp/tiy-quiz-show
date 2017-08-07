class Score < ApplicationRecord
  attr_accessible :submission_id, :sub_total

  belongs_to :submission
end
