class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  layout "home"
  def index
    add_breadcrumb "My Homeworks", root_path
  end
end
