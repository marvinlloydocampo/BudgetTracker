class TransactionEntry < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum transaction_type: [:income, :expenses]
end
