class Diets::ApplicationController < ApplicationController
    before_action :get_diet

    private

    def get_diet
        @diet = @current_user.diets.find_by(id: params[:diet_id])
        redirect_to diets_path if @diet.nil?
    end
end
