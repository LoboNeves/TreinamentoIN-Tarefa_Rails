require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class = classes(:one)
  end

  test "should get index" do
    get classes_url, as: :json
    assert_response :success
  end

  test "should create class" do
    assert_difference('Class.count') do
      post classes_url, params: { class: { day_of_the_week: @class.day_of_the_week, initials: @class.initials, status: @class.status, time: @class.time } }, as: :json
    end

    assert_response 201
  end

  test "should show class" do
    get class_url(@class), as: :json
    assert_response :success
  end

  test "should update class" do
    patch class_url(@class), params: { class: { day_of_the_week: @class.day_of_the_week, initials: @class.initials, status: @class.status, time: @class.time } }, as: :json
    assert_response 200
  end

  test "should destroy class" do
    assert_difference('Class.count', -1) do
      delete class_url(@class), as: :json
    end

    assert_response 204
  end
end
