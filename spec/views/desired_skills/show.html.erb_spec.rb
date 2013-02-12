require 'spec_helper'

describe "desired_skills/show" do
  before(:each) do
    @desired_skill = assign(:desired_skill, stub_model(DesiredSkill,
      :language => "Language"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Language/)
  end
end
