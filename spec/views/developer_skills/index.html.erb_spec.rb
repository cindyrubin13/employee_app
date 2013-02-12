require 'spec_helper'

describe "developer_skills/index" do
  before(:each) do
    assign(:developer_skills, [
      stub_model(DeveloperSkill,
        :language => "Language"
      ),
      stub_model(DeveloperSkill,
        :language => "Language"
      )
    ])
  end

  it "renders a list of developer_skills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Language".to_s, :count => 2
  end
end
