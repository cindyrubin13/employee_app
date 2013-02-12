require 'spec_helper'

describe "developer_skills/show" do
  before(:each) do
    @developer_skill = assign(:developer_skill, stub_model(DeveloperSkill,
      :language => "Language"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Language/)
  end
end
