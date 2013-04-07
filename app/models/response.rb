class Response < ActiveRecord::Base
  attr_accessible :employee_id, :message, :project_request_id, :status
  

  belongs_to :project_request 
  belongs_to :employee
  has_many :employees,  :through => :project_requests
  has_one :request_selection
  #belongs_to :request_selection

  #has_one :reward, :through => :request_selection

  #has_many :evaluations, :through => :reward
  accepts_nested_attributes_for :request_selection, :allow_destroy => true
 # accepts_nested_attributes_for :rewards
  #accepts_nested_attributes_for :evaluations
  #belongs_to :rewards

  
  def has_award?
   !request_selection.nil? && !request_selection.reward.nil? 
  end
  
end
