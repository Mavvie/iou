class HomeController < ApplicationController
  layout 'home_template'
  def index
  end

  def dashboard
    render :dashboard, layout: 'dashboard'
  end
end
