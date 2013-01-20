class AddStatusToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :status, :integer
  end
end
