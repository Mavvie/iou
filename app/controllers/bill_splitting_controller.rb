class BillSplittingController < ApplicationController
  def divide_bill
    @balance = params["invoice"]["invoice_balance"]
    @indv_balance = balance / group.users.size
    group.users.each do |t|
      # TODO
      # Add due date to payments.create
      payments.create(amount: indv_balance, receiver: current_user, sender: t, description: "Payment for #{params["memo"]}")
    end
  end
end