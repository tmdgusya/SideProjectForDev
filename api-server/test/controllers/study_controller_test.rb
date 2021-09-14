require 'test_helper'

class StudyControllerTest < ActionDispatch::IntegrationTest

  test "스터디 추가하기 테스트" do

    user = create_user
    access_token = TokenParser.encode_token({:id => user.id, :role => user.role})[:access_token]
    create_category
    create_skill

    post '/api/study',
         headers: {"x-jwt" => access_token},
         params: {
           :category => 1,
           :onoff_type => 'ONLINE',
           :due_date => '2021-10-09',
           :period_type => 'REGULAR',
           :max_people => 5,
           :title => '로치 스터디',
           :description => '로치 스터디 내용~',
           :skills => [1]
         }

    assert_response :success
    assert_not_nil(Study.find_by_id(1))
  end

end
