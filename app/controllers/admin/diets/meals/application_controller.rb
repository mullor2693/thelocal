class Admin::Diets::Meals::ApplicationController < Admin::Diets::ApplicationController
    before_action :get_meal

    private

    def get_meal
        @meal = @diet.meals.find_by(id: params[:meal_id])
        redirect_to diet_meals_path(@diet) if @meal.nil?
    end
end
