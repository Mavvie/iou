class PaymentMailer < ApplicationMailer
  default from: 'no-reply@iou.com', return_path: 'system@iou.com'
  def notification(receiver)
    mail(to: receiver.email, subject: "New Payment From #{receiver}", text: "#{receiver} has paid you.")
  end
end