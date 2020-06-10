class CreateTransactionEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_entries do |t|
      t.integer :user_id
      t.integer :transaction_type
      t.numeric :amount
      t.integer :category_id
      t.date :transaction_date

      t.timestamps
    end
  end
end
