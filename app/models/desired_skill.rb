class DesiredSkill < ActiveRecord::Base
  attr_accessible :language, :employee_id, :level, :skill_id
  belongs_to :skill
  has_and_belongs_to_many :skills
end
