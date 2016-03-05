module PaymentsHelper
  def label_status_class(status)
    case status
    when 'unpaid'
      'label-danger'
    when 'partially_paid'
      'label-warning'
    when 'paid'
      'label-success'
    end
  end
end
