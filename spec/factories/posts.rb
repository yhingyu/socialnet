FactoryGirl.define do
  factory :post, :class => 'Post' do
    user_id 1
message "MyText"
post_type_id 1
post_parent_id 1
  end

end
