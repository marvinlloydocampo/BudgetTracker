require 'test_helper'

class TransactionListJobTest < ActiveJob::TestCase
  test "perform_now without parameters should only show current date transactions" do
    user_transactions = TransactionListJob.perform_now
    user, transactions = user_transactions.to_a.first

    assert user.name, 'Test User 2'
    assert transactions.count, 1
  end

  test "perform_now with start_date should transaction from start date to current_date" do
    start_date = 1.days.ago.to_date.strftime("%d/%m/%Y")
    user_transactions = TransactionListJob.perform_now(start_date: start_date)

    # transactions for both user should be available
    assert user_transactions.count, 2

    user, transactions = user_transactions.to_a.first
    assert user.name, 'Test User 1'
    assert transactions.count, 1

    user, transactions = user_transactions.to_a.last
    assert user.name, 'Test User 2'
    assert transactions.count, 2
  end

  test "perform_now with start_date and end_date should transaction from start date to end_date" do
    start_date = 1.days.ago.to_date.strftime("%d/%m/%Y")
    end_date = 1.days.after.to_date.strftime("%d/%m/%Y")
    user_transactions = TransactionListJob.perform_now(start_date: start_date, end_date: end_date)

    # transactions for both user should be available
    assert user_transactions.count, 2

    user, transactions = user_transactions.to_a.first
    assert user.name, 'Test User 1'
    assert transactions.count, 2

    user, transactions = user_transactions.to_a.last
    assert user.name, 'Test User 2'
    assert transactions.count, 2
  end

  test "perform_now with different parameter should raise ArgumentError" do
    start_date = 1.days.ago.to_date.strftime("%d/%m/%Y")
    assert_raises ArgumentError do
      TransactionListJob.perform_now(s_date: start_date)
    end
  end
end
