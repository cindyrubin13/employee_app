class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location, :last_name,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in, :password, :password_confirmation, :description
  has_secure_password 
  has_and_belongs_to_many :skills
  serialize :current_skill
  has_many :developer_skills
  belongs_to :skills
  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :developer_skills
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

  radiocheck = 0
     
  developer_skills.each do |dev_id|
    if radiocheck == 0  
      if dev_id.skill_id == skill_id && dev_id.level == level
       radiocheck = 1
    
      else  
       radiocheck = 0
      end

    end
  end
if radiocheck == 1
   return true
else
   return false
end



end  
def add_new_developer
    current_skill.each do  |skill_id, level| 
            developer_skills = DeveloperSkill.new(:employee_id => :id, :skill_id => "#{skill_id}", :level => "#{level}")
            developer_skills.save
     end
end

def show_skill_and_level
      @skillname = Array.new
      @prof_level = Array.new
       current_skill.each_pair do |skill_id, level|
       language = Skill.find_by_id(skill_id).language
       @skillname = @skillname.push(language)
       @prof_level = @prof_level.push(level)
      end
      @skillname = @skillname.join(", ")
      @prof_level = @prof_level.join(", ")

end
#def current_skill=(current_skills)

   # current_skills.each do |skill, level|
    #  developer_skills = DeveloperSkill.new( :skill_id => skill, :level => level)
    #  self.developer_skills 
   # end
 # end
 # def developer_skills
  #  developer_skills = developer_skills.push(developer_skills)
  #end


      

#current_skills = Employee.find(27).current_skill
def to_developer_skills(current_skill)
  #current_skills = Employee.find(current_employee.id).current_skill
  developer_skills = []
  current_skill.each do |skill, level|
      developer_skill = DeveloperSkill.new( :skill_id => skill, :level => level)
      developer_skills = developer_skills.push(developer_skill)

  end
  developer_skills
  #update_developer_skills(developer_skills,current_employee)
end

#def update_developer_skills(developer_skills, current_employee)
 # developer_skills.each do |dev|
 #   dev.update_attributes(developer_skill)
 #end




def current_skill=(current_skill)
  self.developer_skills = to_developer_skills current_skill
end

#def current_skills=
 # self.developer_skills = to_developer_skills current_skills
#end

  # DeveloperSkill.where(:employee_id => current_employee.id).delete_all
       
    #     current_skill.each do |skill_id, level|
     #     @developer_skills = DeveloperSkill.new(:employee_id => current_employee.id, :skill_id => skill_id, :level => level)
      #    @developer_skills.save
       #  end
#end
#def developer_skills_information(current_employee)
  
 # if !current_employee.current_skill.nil?
 #  current_skills = current_employee.current_skill.split(", ")
 # else
 #  []
  #end
   # current_skills.each do |skill_id|
   #       @developer_skills = DeveloperSkill.new(:employee_id => current_employee.id, :skill_id => skill_id)
    #      @developer_skills.save
    #end
   
#end


private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end