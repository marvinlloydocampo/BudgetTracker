require 'test_helper'

class TransactionEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction_entry = transaction_entries(:one)
  end

  test "should get index" do
    get transaction_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_entry_url
    assert_response :success
  end

  test "should create transaction_entry" do
    assert_difference('TransactionEntry.count') do
      post transaction_entries_url, params: { transaction_entry: { amount: @transaction_entry.amount, category_id: @transaction_entry.category_id, transaction_date: @transaction_entry.transaction_date, transaction_type: @transaction_entry.transaction_type, user_id: @transaction_entry.user_id } }
    end

    assert_redirected_to transaction_entry_url(TransactionEntry.last)
  end

  test "should show transaction_entry" do
    get transaction_entry_url(@transaction_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_entry_url(@transaction_entry)
    assert_response :success
  end

  test "should update transaction_entry" do
    patch transaction_entry_url(@transaction_entry), params: { transaction_entry: { amount: @transaction_entry.amount, category_id: @transaction_entry.category_id, transaction_date: @transaction_entry.transaction_date, transaction_type: @transaction_entry.transaction_type, user_id: @transaction_entry.user_id } }
    assert_redirected_to transaction_entry_url(@transaction_entry)
  end

  test "should destroy transaction_entry" do
    assert_difference('TransactionEntry.count', -1) do
      delete transaction_entry_url(@transaction_entry)
    end

    assert_redirected_to transaction_entries_url
  end
end
