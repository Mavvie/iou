class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :receiver, index: true
      t.references :sender, index: true
      t.string :status, default: 'unpaid', null: false

      t.timestamps null: false
    end
  end
end
