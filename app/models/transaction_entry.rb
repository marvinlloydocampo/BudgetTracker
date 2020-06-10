class TransactionEntry < ApplicationRecord
  enum transaction_type: [:income, :expenses]
end
