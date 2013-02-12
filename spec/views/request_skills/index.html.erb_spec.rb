require 'spec_helper'

describe "request_skills/index" do
  before(:each) do
    assign(:request_skills, [
      stub_model(RequestSkill,
        :language => "Language"
      ),
      stub_model(RequestSkill,
        :language => "Language"
      )
    ])
  end

  it "renders a list of request_skills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Language".to_s, :count => 2
  end
end
