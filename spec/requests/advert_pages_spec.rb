require 'spec_helper'

describe "AdvertPages" do
  subject { page }  

  describe "Advert root page" do
    before { visit root_path }
    
#    it { should have_selector('h1', :text => "Sign up here") }
    it { should have_selector('title', :text => "iVarg | All adverts") }
  end
end
