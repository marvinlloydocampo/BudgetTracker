require "application_system_test_case"

class TransactionEntriesTest < ApplicationSystemTestCase
  setup do
    @transaction_entry = transaction_entries(:one)
  end

  test "visiting the index" do
    visit transaction_entries_url
    assert_selector "h1", text: "Transaction Entries"
  end

  test "creating a Transaction entry" do
    visit transaction_entries_url
    click_on "New Transaction Entry"

    fill_in "Amount", with: @transaction_entry.amount
    fill_in "Category", with: @transaction_entry.category_id
    fill_in "Transaction date", with: @transaction_entry.transaction_date
    fill_in "Transaction type", with: @transaction_entry.transaction_type
    fill_in "User", with: @transaction_entry.user_id
    click_on "Create Transaction entry"

    assert_text "Transaction entry was successfully created"
    click_on "Back"
  end

  test "updating a Transaction entry" do
    visit transaction_entries_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @transaction_entry.amount
    fill_in "Category", with: @transaction_entry.category_id
    fill_in "Transaction date", with: @transaction_entry.transaction_date
    fill_in "Transaction type", with: @transaction_entry.transaction_type
    fill_in "User", with: @transaction_entry.user_id
    click_on "Update Transaction entry"

    assert_text "Transaction entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction entry" do
    visit transaction_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction entry was successfully destroyed"
  end
end
