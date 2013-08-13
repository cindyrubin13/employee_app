class StaticPagesController < ApplicationController
  def home
  	@project_request = current_employee.project_requests.build if signed_in?
  end
end
