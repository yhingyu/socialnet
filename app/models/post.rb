class Post < ActiveRecord::Base
  attr_accessible :message, :post_parent_id, :post_type_id, :user_id
  belongs_to :user
end
