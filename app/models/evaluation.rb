class Evaluation < ActiveRecord::Base
  attr_accessible :eval_number, :level, :reward_id, :skill_id, :employee_id
  belongs_to :rewards
end
