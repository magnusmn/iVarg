class Advert < ActiveRecord::Base
  attr_accessible :bid, :body, :price, :title, :user_id

  belongs_to :user

  validates :title,  :presence => true
  validates :body,   :presence => true


end
