require 'test_helper'

class TaskTemplatesControllerTest < ActionController::TestCase
  setup do
    @task_template = task_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_template" do
    assert_difference('TaskTemplate.count') do
      post :create, task_template: { checkpoint: @task_template.checkpoint, description: @task_template.description, dir: @task_template.dir, historyenabled: @task_template.historyenabled, logCluster: @task_template.logCluster, logEpk: @task_template.logEpk, logNfs: @task_template.logNfs, logNode: @task_template.logNode, logPath: @task_template.logPath, maxTime: @task_template.maxTime, name: @task_template.name, nfs: @task_template.nfs, parameters: @task_template.parameters, parametersDescription: @task_template.parametersDescription, passportName: @task_template.passportName, portionCluster: @task_template.portionCluster, portionNode: @task_template.portionNode, portionProgram: @task_template.portionProgram, procNum: @task_template.procNum, profiles: @task_template.profiles, profilesDescription: @task_template.profilesDescription, resultcode: @task_template.resultcode, stopcode: @task_template.stopcode, taskName: @task_template.taskName, userId: @task_template.userId }
    end

    assert_redirected_to task_template_path(assigns(:task_template))
  end

  test "should show task_template" do
    get :show, id: @task_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_template
    assert_response :success
  end

  test "should update task_template" do
    patch :update, id: @task_template, task_template: { checkpoint: @task_template.checkpoint, description: @task_template.description, dir: @task_template.dir, historyenabled: @task_template.historyenabled, logCluster: @task_template.logCluster, logEpk: @task_template.logEpk, logNfs: @task_template.logNfs, logNode: @task_template.logNode, logPath: @task_template.logPath, maxTime: @task_template.maxTime, name: @task_template.name, nfs: @task_template.nfs, parameters: @task_template.parameters, parametersDescription: @task_template.parametersDescription, passportName: @task_template.passportName, portionCluster: @task_template.portionCluster, portionNode: @task_template.portionNode, portionProgram: @task_template.portionProgram, procNum: @task_template.procNum, profiles: @task_template.profiles, profilesDescription: @task_template.profilesDescription, resultcode: @task_template.resultcode, stopcode: @task_template.stopcode, taskName: @task_template.taskName, userId: @task_template.userId }
    assert_redirected_to task_template_path(assigns(:task_template))
  end

  test "should destroy task_template" do
    assert_difference('TaskTemplate.count', -1) do
      delete :destroy, id: @task_template
    end

    assert_redirected_to task_templates_path
  end
end
