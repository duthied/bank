class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :card_number
      t.string :pin

      t.timestamps
    end
  end
end
