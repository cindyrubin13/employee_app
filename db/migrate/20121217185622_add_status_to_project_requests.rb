class AddStatusToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :status, :string
  end
end
