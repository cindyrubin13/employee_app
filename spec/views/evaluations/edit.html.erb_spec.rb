require 'spec_helper'

describe "evaluations/edit" do
  before(:each) do
    @evaluation = assign(:evaluation, stub_model(Evaluation,
      :eval_number => 1,
      :level => 1,
      :reward_id => 1
    ))
  end

  it "renders the edit evaluation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => evaluations_path(@evaluation), :method => "post" do
      assert_select "input#evaluation_eval_number", :name => "evaluation[eval_number]"
      assert_select "input#evaluation_level", :name => "evaluation[level]"
      assert_select "input#evaluation_reward_id", :name => "evaluation[reward_id]"
    end
  end
end
