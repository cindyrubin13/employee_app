require 'spec_helper'

describe "evaluations/index" do
  before(:each) do
    assign(:evaluations, [
      stub_model(Evaluation,
        :eval_number => 1,
        :level => 2,
        :reward_id => 3
      ),
      stub_model(Evaluation,
        :eval_number => 1,
        :level => 2,
        :reward_id => 3
      )
    ])
  end

  it "renders a list of evaluations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
