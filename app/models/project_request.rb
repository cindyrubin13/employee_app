class ProjectRequest < ActiveRecord::Base
  attr_accessible :employee_id, :project_help, :start_date, :end_date, :status, :relevant_skill, :title, :group, :office
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

# def check_end_date
 #   if :end_date < Date.current
 #     errors.add(:end_date, "can only be later than today")
  #  end
  #end

  def check_end_date
    if end_date < Date.today
    
   errors.add(:end_date,  "End Date can only be later than today")
   end
  end



  



end
