class AddGroupToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :group, :string
  end
end
