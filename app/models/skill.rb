class Skill < ActiveRecord::Base
 attr_accessible :language, :skill_ids
  has_and_belongs_to_many :employees
  belongs_to :employees
  belongs_to :project_requests
  belongs_to :rewards
  has_and_belongs_to_many :rewards
  has_and_belongs_to_many :evaluations
  belongs_to :evaluations
end
