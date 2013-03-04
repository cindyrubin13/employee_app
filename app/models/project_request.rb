class ProjectRequest < ActiveRecord::Base
  attr_accessible :employee_id, :project_help, :start_date, :end_date, :status, :relevant_skill, :title, :group, :office, :request_status
  belongs_to :employee
  has_many :responses
  belongs_to :request_selection
 
  has_many :request_selections
  accepts_nested_attributes_for :responses, :allow_destroy => true
  has_and_belongs_to_many :skills
  belongs_to :skills
  
  validate :check_end_date
  validates_numericality_of :employee_id, :only_integer => true
  validates :employee_id, presence: true
  default_scope order: 'project_requests.created_at DESC'



  def check_end_date
    if end_date < Date.today
    
       errors.add(:end_date,  "End Date can only be later than today")
    end
  end

def match_skills(employee)
  skill_score = []
  relevant_skills = relevant_skill.split(", ")
  skill_length = relevant_skills.length
  x = 0
  while x < skill_length
    skill_id = Skill.find_by_language(relevant_skills.slice(x)).id
    developer_skills = DeveloperSkill.find_all_by_employee_id(employee.id)
    developer_skills.each do |dev_id|
      if dev_id.skill_id == skill_id
        skill_score.push(dev_id.level)
        break
      end
    end
    x = x + 1
  end
  skill_score.sum
  end
def match_desired_skills(employee)
  skill_score = []
  relevant_skills = relevant_skill.split(", ")
  skill_length = relevant_skills.length
  x = 0
  while x < skill_length
    skill_id = Skill.find_by_language(relevant_skills.slice(x)).id
    desired_skills = DesiredSkill.find_all_by_employee_id(employee.id)
    desired_skills.each do |des_id|
      if des_id.skill_id == skill_id
        skill_score.push(des_id.level)
        break
      end
    end
    x = x + 1
  end
  skill_score.sum
  end


def current_count(employee)
  overlap_count(relevant_skill, employee.current_skill)
end

def interest_count(employee)
   overlap_count(relevant_skill, employee.skills_interested_in)
end

def overlap_count(skills1, skills2)
   (skills1.split(", ") & skills2.split(", ")).length
end

end



