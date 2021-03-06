class StudyProgramElement < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :element

  validates :element, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }

  def percentage
    ( self.weight/self.requirement.study_program_elements.sum(:weight)*100 )
  end
end
