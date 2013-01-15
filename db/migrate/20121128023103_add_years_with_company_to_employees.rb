class AddYearsWithCompanyToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :years_with_company, :string
  end
end
