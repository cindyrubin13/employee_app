require 'spec_helper'

describe "request_selections/new" do
  before(:each) do
    assign(:request_selection, stub_model(RequestSelection,
      :project_request_id => 1,
      :employee_id => 1,
      :response_id => 1,
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new request_selection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => request_selections_path, :method => "post" do
      assert_select "input#request_selection_project_request_id", :name => "request_selection[project_request_id]"
      assert_select "input#request_selection_employee_id", :name => "request_selection[employee_id]"
      assert_select "input#request_selection_response_id", :name => "request_selection[response_id]"
      assert_select "input#request_selection_comment", :name => "request_selection[comment]"
    end
  end
end
