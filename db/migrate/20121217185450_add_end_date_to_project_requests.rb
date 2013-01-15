class AddEndDateToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :end_date, :date
  end
end
