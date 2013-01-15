require 'spec_helper'

describe "request_selections/show" do
  before(:each) do
    @request_selection = assign(:request_selection, stub_model(RequestSelection,
      :project_request_id => 1,
      :employee_id => 2,
      :response_id => 3,
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Comment/)
  end
end
