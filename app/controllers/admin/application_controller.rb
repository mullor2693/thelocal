class Admin::ApplicationController < ApplicationController
	add_breadcrumb "Dashboard", :admin_dashboard_path
end
