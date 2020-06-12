class TransactionEntry < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum transaction_type: [:income, :expenses]

  scope :transactions_between, ->(start_date, end_date) { where(transaction_date: start_date..end_date) }
end
