class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in, :password, :password_confirmation, :description
  has_secure_password 
  has_and_belongs_to_many :skills
  belongs_to :skills
  has_many :project_requests, dependent: :destroy
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
  
  validates :current_skill, presence: true, :on => :create
  validates :skills_interested_in, presence: true, :on => :create
private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end