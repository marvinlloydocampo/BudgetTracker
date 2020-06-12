require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should show all user transaction if no params search available" do
    get user_url(@user)
    user_transaction_count = TransactionEntry.where(user_id: @user.id).count
    assert_equal user_transaction_count, assigns(:user_transactions).count
  end

  test "should show user transaction based on params search" do
    start_date = 1.days.ago.to_date.strftime("%d/%m/%Y")
    end_date = 3.days.after.to_date.strftime("%d/%m/%Y")
    get user_url(@user), params: { search: { transaction_date_range: "#{start_date} - #{end_date}"}}
    assert_equal 1, assigns(:user_transactions).count
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
