class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :receiver, index: true, foreign_key: true
      t.references :sender, index: true, foreign_key: true
      t.string :status, default: 'unpaid', null: false

      t.timestamps null: false
    end
  end
end
