require 'spec_helper'

describe "rewards/show" do
  before(:each) do
    @reward = assign(:reward, stub_model(Reward,
      :employee_id => 1,
      :project_request_id => 2,
      :reward_points => 3,
      :skill_id => 4,
      :level_change => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
