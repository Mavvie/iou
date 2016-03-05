class HomeController < ApplicationController
  def index
  end

  def dashboard
    render :dashboard, layout: 'dashboard'
  end
end
