require 'test_helper'

class UserTasksControllerTest < ActionController::TestCase
  setup do
    @user_task = user_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_task" do
    assert_difference('UserTask.count') do
      post :create, user_task: { errors: @user_task.errors, manager_log: @user_task.manager_log, mqinfo: @user_task.mqinfo, output: @user_task.output, status: @user_task.status, stdout_rez: @user_task.stdout_rez, task_name: @user_task.task_name, work_status: @user_task.work_status }
    end

    assert_redirected_to user_task_path(assigns(:user_task))
  end

  test "should show user_task" do
    get :show, id: @user_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_task
    assert_response :success
  end

  test "should update user_task" do
    patch :update, id: @user_task, user_task: { errors: @user_task.errors, manager_log: @user_task.manager_log, mqinfo: @user_task.mqinfo, output: @user_task.output, status: @user_task.status, stdout_rez: @user_task.stdout_rez, task_name: @user_task.task_name, work_status: @user_task.work_status }
    assert_redirected_to user_task_path(assigns(:user_task))
  end

  test "should destroy user_task" do
    assert_difference('UserTask.count', -1) do
      delete :destroy, id: @user_task
    end

    assert_redirected_to user_tasks_path
  end
end
