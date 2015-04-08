require 'test_helper'

class TemplatesControllerTest < ActionController::TestCase
  setup do
    @template = templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create template" do
    assert_difference('Template.count') do
      post :create, template: { checkpoint: @template.checkpoint, description: @template.description, dir: @template.dir, historyenabled: @template.historyenabled, logCluster: @template.logCluster, logEpk: @template.logEpk, logNfs: @template.logNfs, logNode: @template.logNode, logPath: @template.logPath, maxTime: @template.maxTime, name: @template.name, nfs: @template.nfs, otherParams: @template.otherParams, parameters: @template.parameters, parametersDescription: @template.parametersDescription, passportName: @template.passportName, portionCluster: @template.portionCluster, portionNode: @template.portionNode, portionProgram: @template.portionProgram, procNum: @template.procNum, profiles: @template.profiles, profilesDescription: @template.profilesDescription, resultcode: @template.resultcode, stopcode: @template.stopcode, taskDescription: @template.taskDescription, taskName: @template.taskName, userId: @template.userId }
    end

    assert_redirected_to template_path(assigns(:template))
  end

  test "should show template" do
    get :show, id: @template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @template
    assert_response :success
  end

  test "should update template" do
    patch :update, id: @template, template: { checkpoint: @template.checkpoint, description: @template.description, dir: @template.dir, historyenabled: @template.historyenabled, logCluster: @template.logCluster, logEpk: @template.logEpk, logNfs: @template.logNfs, logNode: @template.logNode, logPath: @template.logPath, maxTime: @template.maxTime, name: @template.name, nfs: @template.nfs, otherParams: @template.otherParams, parameters: @template.parameters, parametersDescription: @template.parametersDescription, passportName: @template.passportName, portionCluster: @template.portionCluster, portionNode: @template.portionNode, portionProgram: @template.portionProgram, procNum: @template.procNum, profiles: @template.profiles, profilesDescription: @template.profilesDescription, resultcode: @template.resultcode, stopcode: @template.stopcode, taskDescription: @template.taskDescription, taskName: @template.taskName, userId: @template.userId }
    assert_redirected_to template_path(assigns(:template))
  end

  test "should destroy template" do
    assert_difference('Template.count', -1) do
      delete :destroy, id: @template
    end

    assert_redirected_to templates_path
  end
end
