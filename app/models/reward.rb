class Reward < ActiveRecord::Base
  attr_accessible :employee_id, :project_request_id, :reward_date, :skill_id, :request_selection_id, :evaluations_attributes
 
  has_and_belongs_to_many :skills
  
  has_one :employee, :through => :request_selection
  #belongs_to :employee
  #belongs_to :project_request
  #has_one :request_selection
  belongs_to :request_selection
  #belongs_to :developer_skills
 # belongs_to :response
  has_many :evaluations


  accepts_nested_attributes_for :evaluations, :allow_destroy => true

  def has_skill_level(employee_id, skill_id, level)  
  	  developer_skills = DeveloperSkill.find_all_by_employee_id(employee_id)
      developer_skills.each do |dev_id|
        return true  if dev_id.skill_id == skill_id && dev_id.level == level   
      end   
      level == 0
  end




  
 
end
