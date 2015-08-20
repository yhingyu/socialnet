class User < ActiveRecord::Base
  attr_accessible :avatar, :email, :name, :password
  has_many :post, dependent: :destroy
end
