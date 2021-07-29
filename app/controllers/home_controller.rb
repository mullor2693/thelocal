class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  
  def index
    add_breadcrumb "Homeworker", root_path
  end
end
