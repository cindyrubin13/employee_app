class AddStartDateToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :start_date, :date
  end
end
