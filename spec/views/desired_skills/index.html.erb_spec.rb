require 'spec_helper'

describe "desired_skills/index" do
  before(:each) do
    assign(:desired_skills, [
      stub_model(DesiredSkill,
        :language => "Language"
      ),
      stub_model(DesiredSkill,
        :language => "Language"
      )
    ])
  end

  it "renders a list of desired_skills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Language".to_s, :count => 2
  end
end
