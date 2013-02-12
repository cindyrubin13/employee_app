require 'spec_helper'

describe "desired_skills/new" do
  before(:each) do
    assign(:desired_skill, stub_model(DesiredSkill,
      :language => "MyString"
    ).as_new_record)
  end

  it "renders new desired_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => desired_skills_path, :method => "post" do
      assert_select "input#desired_skill_language", :name => "desired_skill[language]"
    end
  end
end
