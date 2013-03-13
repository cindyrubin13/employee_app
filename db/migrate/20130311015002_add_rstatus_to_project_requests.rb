class AddRstatusToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :rstatus, :string
  end
end
