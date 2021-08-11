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

  test "success login if given correct user info" do

    User.join("roach@naver.com", "roach", "1234")

    post "/api/login",
         params: {email: "roach@naver.com", password: "1234"}

    assert_response :success
  end

  test "fail if misinformation email" do

    assert_raise(CodeError) do
      post "/api/login",
           params: {email: "roach@naver.com", password: "1234"}
    end

  end

  test "fail if mis matched password" do

    User.join("roach@naver.com", "roach", "12345")

    assert_raise(CodeError) do
      post "/api/login",
           params: {email: "roach@naver.com", password: "1234"}
    end

  end

end
