require 'spec_helper'

describe "skills/show" do
  before(:each) do
    @skill = assign(:skill, stub_model(Skill,
      :language => "Language"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Language/)
  end
end
