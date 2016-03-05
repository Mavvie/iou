class PaymentsController < ApplicationController
  load_and_authorize_resource :payment

  def index
    @sent_payments = current_user.sent_payments
    @received_payments = current_user.received_payments
  end

  def new
    @payment.assign_attributes((payment_params rescue {}))
  end

  def create
    @payment.save
    respond_with @payment
  end

  def show
  end

private
  def payment_params
    params.require(:payment).permit(:description, :amount, :receiver_id, :sender_id, :due_date)
  end
end
