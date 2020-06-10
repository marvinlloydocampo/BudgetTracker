class User < ApplicationRecord
  has_many :transaction_entries, dependent: :destroy
end
