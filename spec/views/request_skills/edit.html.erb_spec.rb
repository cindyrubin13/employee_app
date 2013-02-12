require 'spec_helper'

describe "request_skills/edit" do
  before(:each) do
    @request_skill = assign(:request_skill, stub_model(RequestSkill,
      :language => "MyString"
    ))
  end

  it "renders the edit request_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => request_skills_path(@request_skill), :method => "post" do
      assert_select "input#request_skill_language", :name => "request_skill[language]"
    end
  end
end
