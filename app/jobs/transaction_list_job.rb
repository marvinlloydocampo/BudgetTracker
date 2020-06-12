class TransactionListJob < ApplicationJob
  include ActionView::Helpers::NumberHelper
  queue_as :default

  def perform(start_date: Date.today, end_date: Date.today)
    transaction_list = TransactionEntry.
      includes(:category, :user).
      transactions_between(start_date.to_date, end_date.to_date)

    transaction_list.group_by(&:user).each do |user, transactions|
      p "List of Transactions for User: #{user.name}"
      transactions.each do |t|
        cols = [t.transaction_date.strftime("%d/%m/%Y"), number_to_currency(t.amount, :unit => '$'), t.category.name]
        p "#{cols.join(" | ")}"
      end
    end
  end
end
