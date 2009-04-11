require 'test_helper'

class OperationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:operations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_operation
    assert_difference('Operation.count') do
      post :create, :operation => { }
    end

    assert_redirected_to operation_path(assigns(:operation))
  end

  def test_should_show_operation
    get :show, :id => operations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => operations(:one).id
    assert_response :success
  end

  def test_should_update_operation
    put :update, :id => operations(:one).id, :operation => { }
    assert_redirected_to operation_path(assigns(:operation))
  end

  def test_should_destroy_operation
    assert_difference('Operation.count', -1) do
      delete :destroy, :id => operations(:one).id
    end

    assert_redirected_to operations_path
  end
end
