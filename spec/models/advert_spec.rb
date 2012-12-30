# == Schema Information
#
# Table name: adverts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  bid        :integer
#  price      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Advert do
  before { @advert = Advert.new(title: "Shoes",
                                body:  "Lovely shoes for sale, please try them out.",
                                price: 100,
                                bid:   999) }
 
  subject { @advert }
    
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:price) }
  it { should respond_to(:bid) }
  it { should respond_to(:user_id) }

  describe "it should have a title" do
    before { @advert.title = "" }

    it { should_not be_valid }
  end

  describe "it should have a body" do
    before { @advert.body = "" }

    it { should_not be_valid }
  end

  describe "when a price is invalid" do
    it "should be rejected" do
      prices = [ -1, -100, -5 -100 ]
      prices.each do |invalid_price|
        @advert.price = invalid_price
        @advert.should_not be_valid
      end 
    end 
  end

  describe "when a price is valid" do
    it "should be acepted" do
      prices = [ 0, 100, 5, 1066 ]
      prices.each do |valid_price|
        @advert.price = valid_price
        @advert.should be_valid
      end 
    end 
  end

end
