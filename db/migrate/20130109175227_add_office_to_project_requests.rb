class AddOfficeToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :office, :string
  end
end
