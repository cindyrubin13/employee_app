class Reward < ActiveRecord::Base
  attr_accessible :employee_id, :level_change, :project_request_id, :reward_date, :reward_points, :skill_id, :response_id, :skill_change, :total_days, :skill_days
 
  attr_accessor :skill_change
  has_many :employees
  has_many :project_requests
  has_and_belongs_to_many :skills
  has_many :skills
  belongs_to :skills
  belongs_to :employees
  belongs_to :project_requests
  belongs_to :responses
  belongs_to :request_selections
  belongs_to :developer_skills
  has_many :developer_skills
  accepts_nested_attributes_for :developer_skills

  def has_skill_level(employee_id, skill_id, level)  
  	  developer_skills = DeveloperSkill.find_all_by_employee_id(employee_id)
      developer_skills.each do |dev_id|
        return true  if dev_id.skill_id == skill_id && dev_id.level == level   
      end   
      level == 0
  end




  def to_rewards(skill_change, employee_id)
    if !skill_change.nil?
      rewards = []
      rewards = Reward.find_all_by_employee_id(employee_id)
      skill_change.each do |skill, level|
        if level != "0"
          rewards.push(Reward.new(:employee_id => employee_id, :skill_id => skill, :level_change => level ))
        end
      end
      rewards
    end
  end



  def skill_change=(skill_change)
    self.rewards = to_rewards skill_change
  end
  #def skill_change=(skill_change)
  #  self.developer_skills = to_developer_skills skill_change
  #end

  #def to_developer_skills(skill_change)
   # if !skill_change.nil?
   #   rewards = []
    #  skill_change.each do |skill, level|
    #    if level != "0"
     #     rewards.push(Reward.new( :skill_id => skill, :level => level))
    #    end
    #  end
    #  rewards
   # end
  #end

end
