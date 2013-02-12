require 'spec_helper'

describe "request_skills/new" do
  before(:each) do
    assign(:request_skill, stub_model(RequestSkill,
      :language => "MyString"
    ).as_new_record)
  end

  it "renders new request_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => request_skills_path, :method => "post" do
      assert_select "input#request_skill_language", :name => "request_skill[language]"
    end
  end
end
