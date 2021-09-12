class Admin::Diets::ApplicationController < Admin::ApplicationController
    before_action :get_diet
    add_breadcrumb "Nutrición", :admin_nutrition_path
    add_breadcrumb "Dietas", :admin_diets_path

    private

    def get_diet
        @diet = Diet.find_by(id: params[:diet_id])
        redirect_to diets_path if @diet.nil?
    end
end
