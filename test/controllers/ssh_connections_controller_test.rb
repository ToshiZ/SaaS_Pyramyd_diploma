require 'test_helper'

class SshConnectionsControllerTest < ActionController::TestCase
  setup do
    @ssh_connection = ssh_connections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ssh_connections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ssh_connection" do
    assert_difference('SshConnection.count') do
      post :create, ssh_connection: { ip: @ssh_connection.ip, login: @ssh_connection.login, name: @ssh_connection.name }
    end

    assert_redirected_to ssh_connection_path(assigns(:ssh_connection))
  end

  test "should show ssh_connection" do
    get :show, id: @ssh_connection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ssh_connection
    assert_response :success
  end

  test "should update ssh_connection" do
    patch :update, id: @ssh_connection, ssh_connection: { ip: @ssh_connection.ip, login: @ssh_connection.login, name: @ssh_connection.name }
    assert_redirected_to ssh_connection_path(assigns(:ssh_connection))
  end

  test "should destroy ssh_connection" do
    assert_difference('SshConnection.count', -1) do
      delete :destroy, id: @ssh_connection
    end

    assert_redirected_to ssh_connections_path
  end
end
