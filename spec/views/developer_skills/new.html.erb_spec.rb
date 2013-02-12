require 'spec_helper'

describe "developer_skills/new" do
  before(:each) do
    assign(:developer_skill, stub_model(DeveloperSkill,
      :language => "MyString"
    ).as_new_record)
  end

  it "renders new developer_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => developer_skills_path, :method => "post" do
      assert_select "input#developer_skill_language", :name => "developer_skill[language]"
    end
  end
end
