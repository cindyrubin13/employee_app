class RequestSelection < ActiveRecord::Base
  attr_accessible :comment, :employee_id, :project_request_id, :response_id
  has_one :employee, :through => :response
  belongs_to :response
  belongs_to :project_request
  belongs_to :employee
  has_one :reward

 # has_many :evaluations, :through => :reward
  #has_one :employee
 # belongs_to :employee
  #belongs_to :reward
  accepts_nested_attributes_for :reward
  #accepts_nested_attributes_for :evaluations


end
