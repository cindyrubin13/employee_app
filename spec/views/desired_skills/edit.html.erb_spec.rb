require 'spec_helper'

describe "desired_skills/edit" do
  before(:each) do
    @desired_skill = assign(:desired_skill, stub_model(DesiredSkill,
      :language => "MyString"
    ))
  end

  it "renders the edit desired_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => desired_skills_path(@desired_skill), :method => "post" do
      assert_select "input#desired_skill_language", :name => "desired_skill[language]"
    end
  end
end
