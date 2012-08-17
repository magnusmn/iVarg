require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit root_path }

    it "should have the h1 'Home'" do
      page.should have_selector('h1', :text => "iVarg")
    end
    it "should have the right title" do
      page.should have_selector('title', :text => "iVarg | Home")
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "should have the h1 'Help'" do
      page.should have_selector('h1', :text => "Help")
    end
    it "should have the right title" do
      page.should have_selector('title', :text => "iVarg | Help")
    end
  end

end
