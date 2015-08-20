require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest

  setup { host! 'api.socialnet-dev.me' }

  test 'returns list of all users' do
    get '/v1/users'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns user filtered by email' do
    eyu = User.create!(name: 'Eyu', email: 'eyu@email.com')
    zidric = User.create!(name: 'Zidric', email: 'zidric@email.com')

    get '/v1/users?email=eyu@email.com'
    assert_equal 200, response.status

    users = json(response.body)
    names = users.collect { |u| u[:name] }
    assert_includes names, 'Eyu'
    refute_includes names, 'Zidric'
  end

  test 'returns user by id' do
    user = User.create!(name: 'Eyu', email: 'eyu@email.com')
    get "/v1/users/#{ user.id }"
    assert_equal 200, response.status

    user_response = json(response.body)
    assert_equal user.name, user_response[:name]
  end
end