class RequirementElement < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :element

  validates :requirement_id, presence: true
  validates :element_id, presence: true
end
