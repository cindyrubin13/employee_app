class Evaluation < ActiveRecord::Base
  attr_accessible :eval_number, :level, :reward_id, :skill_id, :employee_id
  belongs_to :reward
  belongs_to :response
  belongs_to :request_selection
  belongs_to :employee
  belongs_to :project_request
  belongs_to :skill
  has_and_belongs_to_many :skills
  #accepts_nested_attributes_for :skills
 
  def average_eval
    average(self.eval_number).to_i 
  end

end
