class Admin::DashboardController < Admin::ApplicationController
  def index
  end

  def profile
  end

  def nutrition
    add_breadcrumb "Nutrición", :admin_nutrition_path
  end
end