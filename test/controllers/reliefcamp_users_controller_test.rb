require 'test_helper'

class ReliefcampUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reliefcamp_user = reliefcamp_users(:one)
  end

  test "should get index" do
    get reliefcamp_users_url
    assert_response :success
  end

  test "should get new" do
    get new_reliefcamp_user_url
    assert_response :success
  end

  test "should create reliefcamp_user" do
    assert_difference('ReliefcampUser.count') do
      post reliefcamp_users_url, params: { reliefcamp_user: { Address: @reliefcamp_user.Address, Age: @reliefcamp_user.Age, Gender: @reliefcamp_user.Gender, Name: @reliefcamp_user.Name, Phone: @reliefcamp_user.Phone } }
    end

    assert_redirected_to reliefcamp_user_url(ReliefcampUser.last)
  end

  test "should show reliefcamp_user" do
    get reliefcamp_user_url(@reliefcamp_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_reliefcamp_user_url(@reliefcamp_user)
    assert_response :success
  end

  test "should update reliefcamp_user" do
    patch reliefcamp_user_url(@reliefcamp_user), params: { reliefcamp_user: { Address: @reliefcamp_user.Address, Age: @reliefcamp_user.Age, Gender: @reliefcamp_user.Gender, Name: @reliefcamp_user.Name, Phone: @reliefcamp_user.Phone } }
    assert_redirected_to reliefcamp_user_url(@reliefcamp_user)
  end

  test "should destroy reliefcamp_user" do
    assert_difference('ReliefcampUser.count', -1) do
      delete reliefcamp_user_url(@reliefcamp_user)
    end

    assert_redirected_to reliefcamp_users_url
  end
end
