require 'spec_helper'

describe "evaluations/show" do
  before(:each) do
    @evaluation = assign(:evaluation, stub_model(Evaluation,
      :eval_number => 1,
      :level => 2,
      :reward_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
