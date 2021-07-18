class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  layout "home"
  def index
    add_breadcrumb "Homeworker", root_path
  end
end
