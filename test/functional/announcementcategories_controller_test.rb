require 'test_helper'

class AnnouncementcategoriesControllerTest < ActionController::TestCase
  setup do
    @announcementcategory = announcementcategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announcementcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announcementcategory" do
    assert_difference('Announcementcategory.count') do
      post :create, :announcementcategory => @announcementcategory.attributes
    end

    assert_redirected_to announcementcategory_path(assigns(:announcementcategory))
  end

  test "should show announcementcategory" do
    get :show, :id => @announcementcategory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @announcementcategory.to_param
    assert_response :success
  end

  test "should update announcementcategory" do
    put :update, :id => @announcementcategory.to_param, :announcementcategory => @announcementcategory.attributes
    assert_redirected_to announcementcategory_path(assigns(:announcementcategory))
  end

  test "should destroy announcementcategory" do
    assert_difference('Announcementcategory.count', -1) do
      delete :destroy, :id => @announcementcategory.to_param
    end

    assert_redirected_to announcementcategories_path
  end
end
