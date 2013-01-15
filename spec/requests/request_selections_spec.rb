require 'spec_helper'

describe "RequestSelections" do
  describe "GET /request_selections" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get request_selections_path
      response.status.should be(200)
    end
  end
end
