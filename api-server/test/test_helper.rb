ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  ActiveRecord::Migration.maintain_test_schema!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_user
    post '/api/join',
         params: {email: "roach@naver.com", password: "1234", "nickname": "roach"}
    assert_response :success

    user = User.find_by_email("roach@naver.com")
    assert_not_nil(user)
    user
  end

  def create_category
    post '/api/category',
         params: {name: "category"}

    assert_response :success
    category = Category.find_by_id(1)
    assert_not_nil(category)
    category
  end

  def create_skill
    post '/api/framework',
         params: {name: "react", img_url: "https://www.naver.com", type: 'front'}
    assert_response :success
    assert_not_nil(Framework.find_by_id(1))
  end
end
