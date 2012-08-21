require 'spec_helper'

describe "UserPages" do
  describe "Signup page" do
    before { visit  signup_path }

    it "should have the h1 'Home'" do
      page.should have_selector('h1', :text => "Sign up here")
    end
    it "should have the right title" do
      page.should have_selector('title', :text => "iVarg | Sign up")
    end
  end
end
