class AddTitleToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :title, :string
  end
end
