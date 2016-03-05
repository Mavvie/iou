class AddDescriptionToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :description, :text
  end
end
