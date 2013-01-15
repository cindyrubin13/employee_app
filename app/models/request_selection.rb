class RequestSelection < ActiveRecord::Base
  attr_accessible :comment, :employee_id, :project_request_id, :response_id
  has_many :employees, :through => :responses
  belongs_to :response
  belongs_to :project_request
  belongs_to :employee
end
