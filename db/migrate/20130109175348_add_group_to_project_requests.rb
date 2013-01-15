class AddGroupToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :group, :string
  end
end
