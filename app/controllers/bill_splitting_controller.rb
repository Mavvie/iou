class BillSplittingController < ApplicationController

  def new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    balance = params[:amount].to_f / @group.users.size

    @group.users.each do |user|
      next if user == current_user
      user.sent_payments.create!(payment_params) do |payment|
        payment.amount = balance
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
