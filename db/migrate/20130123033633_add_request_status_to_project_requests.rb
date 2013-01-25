class AddRequestStatusToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :request_status, :integer
  end
end
