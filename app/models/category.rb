class Category < ApplicationRecord
  has_many :transaction_entries
end
