require 'spec_helper'

describe "rewards/index" do
  before(:each) do
    assign(:rewards, [
      stub_model(Reward,
        :employee_id => 1,
        :project_request_id => 2,
        :reward_points => 3,
        :skill_id => 4,
        :level_change => 5
      ),
      stub_model(Reward,
        :employee_id => 1,
        :project_request_id => 2,
        :reward_points => 3,
        :skill_id => 4,
        :level_change => 5
      )
    ])
  end

  it "renders a list of rewards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
