class CreateTransactionLogs < ActiveRecord::Migration
  def change
    create_table :transaction_logs do |t|
      t.integer :user_id
      t.integer :account_id
      t.decimal :before_balance
      t.decimal :after_balance

      t.timestamps
    end
  end
end
