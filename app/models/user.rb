class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :adverts 

  VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with    => VALID_EMAIL_REGEX, 
                                   :message => "Not a valid email address" }

end
