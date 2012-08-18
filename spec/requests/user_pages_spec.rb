require 'spec_helper'

describe "UserPages" do
  describe "GET signup page" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get signup_path 
      response.status.should be(200)
    end
  end
end
