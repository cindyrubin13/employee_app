class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location, :last_name,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in, :password, :password_confirmation, :description
  has_secure_password 
  has_and_belongs_to_many :skills
  serialize :current_skill
  has_many :developer_skills
  belongs_to :skills
  accepts_nested_attributes_for :skills
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
  
def developer_skills_update_information(current_employee)

   DeveloperSkill.where(:employee_id => current_employee.id).delete_all
        if !@employee.current_skill.nil?
          current_skills = @employee.current_skill.split(", ")
        end
         current_skills.each do |skill_id|
          @developer_skills = DeveloperSkill.new(:employee_id => current_employee.id, :skill_id => skill_id)
          @developer_skills.save
         end
end
def developer_skills_information(current_employee)
  
  if !current_employee.current_skill.nil?
   current_skills = current_employee.current_skill.split(", ")
  else
   []
  end
    current_skills.each do |skill_id|
          @developer_skills = DeveloperSkill.new(:employee_id => current_employee.id, :skill_id => skill_id)
          @developer_skills.save
    end
   
end


private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end