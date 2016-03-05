class TransfersController < ApplicationController
  load_and_authorize_resource :payment
  load_and_authorize_resource :transfer, through: :payment

  def new
  end

  def create
    if @transfer.save
      respond_with @payment
    else
      respond_with @payment, @transfer
    end
  end

private
  def transfer_params
    params.require(:transfer).permit(:amount, :transfer_method)
  end
end
