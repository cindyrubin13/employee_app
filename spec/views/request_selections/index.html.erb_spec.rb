require 'spec_helper'

describe "request_selections/index" do
  before(:each) do
    assign(:request_selections, [
      stub_model(RequestSelection,
        :project_request_id => 1,
        :employee_id => 2,
        :response_id => 3,
        :comment => "Comment"
      ),
      stub_model(RequestSelection,
        :project_request_id => 1,
        :employee_id => 2,
        :response_id => 3,
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of request_selections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
