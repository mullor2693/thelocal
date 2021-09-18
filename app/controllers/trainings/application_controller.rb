class Trainings::ApplicationController < ApplicationController
    before_action :get_training

    private

    def get_training
        @training = Training.find_by(id: params[:training_id])
        redirect_to trainings_path if @training.nil?
    end
end
