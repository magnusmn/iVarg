require 'spec_helper'

describe User do
  before { @user = User.new(name: "Apa Nilsson",
                            email: "apa@nilsson.com") }

  it "should have an attribute 'name'" do
    @user.should respond_to(:name)
  end
  it "should have an attribute 'email'" do
    @user.should respond_to(:email)
  end

  describe "when name is not present" do
    before { @user.name = "  " }

    it "should not be valid" do
      @user.should_not be_valid
    end
  end

  describe "when name is to long" do
    before { @user.name = "a"*51 }

    it "should not be valid" do
      @user.should_not be_valid
    end
  end

  describe "when email is not present" do
    before { @user.email = "  " }

    it "should not be valid" do
      @user.should_not be_valid
    end
  end
end
