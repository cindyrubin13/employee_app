require 'spec_helper'

describe "developer_skills/edit" do
  before(:each) do
    @developer_skill = assign(:developer_skill, stub_model(DeveloperSkill,
      :language => "MyString"
    ))
  end

  it "renders the edit developer_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => developer_skills_path(@developer_skill), :method => "post" do
      assert_select "input#developer_skill_language", :name => "developer_skill[language]"
    end
  end
end
