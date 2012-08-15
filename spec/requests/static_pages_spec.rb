require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the h1 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => "iVarg")
    end
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "iVarg | Home")
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => "Help")
    end
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "iVarg | Help")
    end
  end

end
