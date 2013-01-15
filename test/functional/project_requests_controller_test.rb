require 'test_helper'

class ProjectRequestsControllerTest < ActionController::TestCase
  setup do
    @project_request = project_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_request" do
    assert_difference('ProjectRequest.count') do
      post :create, project_request: { employee_id: @project_request.employee_id, project_help: @project_request.project_help }
    end

    assert_redirected_to project_request_path(assigns(:project_request))
  end

  test "should show project_request" do
    get :show, id: @project_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_request
    assert_response :success
  end

  test "should update project_request" do
    put :update, id: @project_request, project_request: { employee_id: @project_request.employee_id, project_help: @project_request.project_help }
    assert_redirected_to project_request_path(assigns(:project_request))
  end

  test "should destroy project_request" do
    assert_difference('ProjectRequest.count', -1) do
      delete :destroy, id: @project_request
    end

    assert_redirected_to project_requests_path
  end
end
