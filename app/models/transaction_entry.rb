class TransactionEntry < ApplicationRecord
  belongs_to :user
  enum transaction_type: [:income, :expenses]
end
