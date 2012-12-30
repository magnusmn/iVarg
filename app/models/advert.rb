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

class Advert < ActiveRecord::Base
  attr_accessible :bid, :body, :price, :title, :user_id

  belongs_to :user

  validates :title,  :presence => true
  validates :body,   :presence => true
  validates_numericality_of :price, :only_integer => true,
                                    :greater_than_or_equal_to => 0,
                                    :message => "Can only be whole number."
end
