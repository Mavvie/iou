class HomeController < ApplicationController
  layout 'home_template'
  def index
    if current_user
      if current_user.groups.any?
        redirect_to :payments
      else
        redirect_to new_group_path
      end
    end
  end

  def dashboard
    render :dashboard, layout: 'dashboard'
  end
end
