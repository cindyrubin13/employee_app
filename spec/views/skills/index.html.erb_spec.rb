require 'spec_helper'

describe "skills/index" do
  before(:each) do
    assign(:skills, [
      stub_model(Skill,
        :language => "Language"
      ),
      stub_model(Skill,
        :language => "Language"
      )
    ])
  end

  it "renders a list of skills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Language".to_s, :count => 2
  end
end
