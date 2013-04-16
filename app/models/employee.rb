class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location, :last_name, :current_skills,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in, :password, :password_confirmation, :description
  has_secure_password 
  has_and_belongs_to_many :skills
  attr_accessor :current_skills
  attr_accessor :skills_interested_in
  has_many :developer_skills
  has_many :desired_skills
  has_many :rewards, :through => :request_selection
  #belongs_to :reward
  has_many :evaluations
  belongs_to :skill
  has_and_belongs_to_many :skills
  has_many :request_selections
  belongs_to :request_selection
  accepts_nested_attributes_for :desired_skills
  #has_many :evaluations
  has_many :project_requests
  belongs_to :project_request
  #belongs_to :evaluation
  has_many :responses, :through => :project_request
  #has_one :request_selection, :through => :responses
  #has_one :request_selection
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
  
  def average_eval(skill)
    average_evaluation = 0
    eval_counter = 0
    request_selections.each do |request_selection|
      if !request_selection.reward.evaluations.nil?
        request_selection.reward.evaluations.each do |evaluation|
          if evaluation.skill_id == skill.id && evaluation.eval_number != 0
            average_evaluation += evaluation.level
            eval_counter += 1
          end
        end
      end
    end
    average_evaluation.to_f/eval_counter
  end

  def award_skills(response)
  reward_skill = []
  response.request_selection.reward.evaluations.each do |evaluation|
    if evaluation.eval_number != 0 
      language = evaluation.skill.language
      reward_skill.push(language)
      reward_skill.push(evaluation.eval_number)
    end
  end 
    if !reward_skill.nil?
       reward_skill.join(", ")
    end
  end

  def view_rewards(request_selection) 
    reward_skill = []
    request_selection.reward.evaluations.each do |evaluation|
      if evaluation.eval_number != 0 
        language = evaluation.skill.language
        reward_skill.push(language)
        reward_skill.push(evaluation.eval_number)
      end
    end 
    reward_skill.join(", ")
  end

 

  def desired_skill_level(skill_id, level) 
      desired_skills.each do |dev_id|
        return true  if dev_id.skill_id == skill_id  &&  dev_id.level == level
      end
      level == 0
  end
 
  
  def to_developer_skills(current_skills)
    if !current_skills.nil?
      developer_skills = []
      current_skills.each do |skill, level|
        if level != "0"
          developer_skills.push(DeveloperSkill.new( :skill_id => skill, :level => level))
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
          desired_skills.push(DesiredSkill.new( :skill_id => skill, :level => level))
        end
      end
      desired_skills
    end
  end

  def show_des_skill_and_level
    skillname = [] 
      desired_skills.each do |des_skill| 
        if des_skill.level != 0
        language = des_skill.skill.language
        level = des_skill.level
        skillname.push(language)
        skillname.push(level)
        end
      end
    skillname.join(", ") 
 end
    
  def show_dev_skill_and_level
    skillname = [] 
      developer_skills.each do |dev_skill| 
        if dev_skill.level != 0
         language = dev_skill.skill.language
         level = dev_skill.level
         skillname.push(language)
         skillname.push(level)
        end
      end
    skillname.join(", ") 
  end

  def total_evaluations(skill)
    total_evaluation = 0
      request_selections.each do |request_selection|
        if !request_selection.reward.evaluations.nil?
          request_selection.reward.evaluations.each do |evaluation|
            if evaluation.skill_id == skill.id
              total_evaluation += evaluation.eval_number
            end
          end
        end
      end
      total_evaluation
  end
  def evaluation_check
    request_selections.each do |request_selection|
      return true if !request_selection.reward.evaluations.nil?   
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
