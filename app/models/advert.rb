class Advert < ActiveRecord::Base
  attr_accessible :bid, :body, :price, :title, :user_id
end
