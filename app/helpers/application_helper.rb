module ApplicationHelper
  def active_class_for(obj)
    if url_for(obj) == request.path
      'active'
    end
  end
end
