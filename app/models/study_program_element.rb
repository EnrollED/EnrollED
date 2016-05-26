class StudyProgramElement < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :element

  validates :element, presence: true
  validates :weight, presence: true
end
