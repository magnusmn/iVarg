# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Apa Nilsson", email: "apa@nilsson.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:admin) }
  it { should_not be_admin }

  describe "when name is not present" do
    before { @user.name = "  " }
    
    it { should_not be_valid }
  end

  describe "when name is to long" do
    before { @user.name = "a"*51 }

    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = "  " }

    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |invalid_address|
        @user.email = invalid_address 
        @user.should be_valid
      end
    end
  end

  describe "when a password is to short" do
    before { @user.password = "short" }

    it { should_not be_valid }
  end

  describe "when a password and confirmation are not the same" do
    before { @user.password_confirmation = "wrongpass" }

    it { should_not be_valid }
  end
end
