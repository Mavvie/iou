class BillSplittingController < ApplicationController

  def new
  end

  def create
    @balance = params["invoice"]["invoice_balance"]
    @indv_balance = balance / group.users.size
    group.users.each do |user|
      next if user == current_user
      user.sent_payments.create(payment_params).tap do |payment|
        payment.amount = indv_balance
        payment.receiver = current_user
      end
    end
    flash[:success] = "Successfully split bill"
    redirect_to :payments
  end

private
  def payment_params
    params.require(:payment).permit(:description, :due_date)
  end
end
