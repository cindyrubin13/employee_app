class DeveloperSkill < ActiveRecord::Base
  attr_accessible :language, :employee_id, :level, :skill_id
   has_and_belongs_to_many  :employees
   belongs_to :employees
   
   has_many :skills
   has_many :employees
   belongs_to :skill
  has_and_belongs_to_many :skills
end
