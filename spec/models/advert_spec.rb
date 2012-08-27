require 'spec_helper'

describe Advert do
  before { @advert = Advert.new(title: "Shoes",
                                body:  "Lovely shoes for sale, please try them out.",
                                price: 100,
                                bid:   999) }

  it "should have an attribute 'title'" do
    @advert.should respond_to(:title)
  end
  it "should have an attribute 'body'" do
    @advert.should respond_to(:body)
  end
  it "should have an attribute 'price'" do
    @advert.should respond_to(:price)
  end
  it "should have an attribute 'bid'" do
    @advert.should respond_to(:bid)
  end

end
