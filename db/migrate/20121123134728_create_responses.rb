class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :message
      t.integer :employee_id
      t.integer :project_request_id

      t.timestamps
    end
  end
end
