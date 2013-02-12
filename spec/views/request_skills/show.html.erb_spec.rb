require 'spec_helper'

describe "request_skills/show" do
  before(:each) do
    @request_skill = assign(:request_skill, stub_model(RequestSkill,
      :language => "Language"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Language/)
  end
end
