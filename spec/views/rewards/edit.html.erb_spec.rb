require 'spec_helper'

describe "rewards/edit" do
  before(:each) do
    @reward = assign(:reward, stub_model(Reward,
      :employee_id => 1,
      :project_request_id => 1,
      :reward_points => 1,
      :skill_id => 1,
      :level_change => 1
    ))
  end

  it "renders the edit reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rewards_path(@reward), :method => "post" do
      assert_select "input#reward_employee_id", :name => "reward[employee_id]"
      assert_select "input#reward_project_request_id", :name => "reward[project_request_id]"
      assert_select "input#reward_reward_points", :name => "reward[reward_points]"
      assert_select "input#reward_skill_id", :name => "reward[skill_id]"
      assert_select "input#reward_level_change", :name => "reward[level_change]"
    end
  end
end
