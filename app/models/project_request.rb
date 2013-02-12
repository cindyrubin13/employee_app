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



