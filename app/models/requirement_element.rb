class RequirementElement < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :element
end
