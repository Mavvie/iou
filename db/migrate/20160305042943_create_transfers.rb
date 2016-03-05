class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.decimal :amount
      t.string :transfer_method
      t.references :payment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
