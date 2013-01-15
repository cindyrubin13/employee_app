class AddPasswordToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :password, :string
  end
end
