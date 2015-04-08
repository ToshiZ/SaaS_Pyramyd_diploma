require 'test_helper'

class UserTasksInfosControllerTest < ActionController::TestCase
  setup do
    @user_tasks_info = user_tasks_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_tasks_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_tasks_info" do
    assert_difference('UserTasksInfo.count') do
      post :create, user_tasks_info: { errors: @user_tasks_info.errors, manager_log: @user_tasks_info.manager_log, mqinfo: @user_tasks_info.mqinfo, output: @user_tasks_info.output, stdout_rez: @user_tasks_info.stdout_rez, task_name: @user_tasks_info.task_name, work_status: @user_tasks_info.work_status }
    end

    assert_redirected_to user_tasks_info_path(assigns(:user_tasks_info))
  end

  test "should show user_tasks_info" do
    get :show, id: @user_tasks_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_tasks_info
    assert_response :success
  end

  test "should update user_tasks_info" do
    patch :update, id: @user_tasks_info, user_tasks_info: { errors: @user_tasks_info.errors, manager_log: @user_tasks_info.manager_log, mqinfo: @user_tasks_info.mqinfo, output: @user_tasks_info.output, stdout_rez: @user_tasks_info.stdout_rez, task_name: @user_tasks_info.task_name, work_status: @user_tasks_info.work_status }
    assert_redirected_to user_tasks_info_path(assigns(:user_tasks_info))
  end

  test "should destroy user_tasks_info" do
    assert_difference('UserTasksInfo.count', -1) do
      delete :destroy, id: @user_tasks_info
    end

    assert_redirected_to user_tasks_infos_path
  end
end
