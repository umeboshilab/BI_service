require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get delete" do
    get tasks_delete_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
    assert_response :success
  end

  test "should get update" do
    get tasks_update_url
    assert_response :success
  end
end
