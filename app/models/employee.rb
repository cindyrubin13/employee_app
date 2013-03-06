class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location, :last_name, :current_skills,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in, :password, :password_confirmation, :description
  has_secure_password 
  has_and_belongs_to_many :skills
  attr_accessor :current_skills
  attr_accessor :skills_interested_in
  has_many :developer_skills
  has_many :desired_skills
  belongs_to :skills
  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :developer_skills
  accepts_nested_attributes_for :desired_skills
  has_many :project_requests
  belongs_to :project_request
  has_many :responses, :through => :project_request
  has_many :request_selections, :through => :responses

   before_save { |employee| employee.employee_email = employee_email.downcase }
 before_save :create_remember_token 
validates :employee_name, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :employee_email, presence: true, 
            format: { with: VALID_EMAIL_REGEX } ,
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 } , :on => :create
  
 
  validates :password_confirmation, presence: true, :on => :create
  def has_skill_level(skill_id, level) 
   
      developer_skills.each do |dev_id|
       return true  if dev_id.skill_id == skill_id && dev_id.level == level
         
          end
        
      level == 0
end
 


  def desired_skill_level(skill_id, level) 

  desired_skills.each do |dev_id|
       return true  if dev_id.skill_id == skill_id && dev_id.level == level

          end
        
      level == 0
    end
 

def new_skill_level(skill_id, level) 

 
    level == 3

end  
  


def to_developer_skills(current_skills)
 
   if !current_skills.nil?
  developer_skills = []
  current_skills.each do |skill, level|
      if level != "0"
      developer_skill = DeveloperSkill.new( :skill_id => skill, :level => level)
      developer_skills = developer_skills.push(developer_skill)
      end
  end
  developer_skills
  
end
end

def to_desired_skills(skills_interested_in)
 
   if !skills_interested_in.nil?
  desired_skills = []
  skills_interested_in.each do |skill, level|
      if level != "0"
      desired_skill = DesiredSkill.new( :skill_id => skill, :level => level)
      desired_skills = desired_skills.push(desired_skill)
      end
  end
  desired_skills
  
end
end






def current_skills=(current_skills)
  self.developer_skills = to_developer_skills current_skills
end

def skills_interested_in=(skills_interested_in)
  self.desired_skills = to_desired_skills skills_interested_in
end



private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end