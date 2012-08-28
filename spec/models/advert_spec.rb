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

  describe "it should have a title" do
    before { @advert.title = "" }

    it { should_not be_valid }
  end

  describe "it should have a body" do
    before { @advert.body = "" }

    it { should_not be_valid }
  end

end
