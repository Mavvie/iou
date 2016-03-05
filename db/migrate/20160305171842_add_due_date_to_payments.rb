class AddDueDateToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :due_date, :date
  end
end
