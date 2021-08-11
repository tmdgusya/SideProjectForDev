require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  test "success join if given correct user_info" do
    post "/api/join",
         params: {email: "roach@naver.com", password: "1234", "nickname": "roach"}
    assert_response :success
  end

  test "raise CodeError if duplicate email when user join our's website" do
    post "/api/join",
         params: {email: "roach@naver.com", password: "1234", "nickname": "roach"}

    assert_raise(CodeError) do
      post "/api/join",
           params: {email: "roach@naver.com", password: "1234", "nickname": "roach"}
    end
    assert_response :success
  end

end
