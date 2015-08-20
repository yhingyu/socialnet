require 'test_helper'

class ListingPostsTest < ActionDispatch::IntegrationTest

  setup { host! 'api.socialnet-dev.me' }

  test 'returns list of all posts' do
    get '/v1/posts'
    assert_equal 200, response.status
    refute_empty response.body
  end
end