class DashboardController < ApplicationController
  add_breadcrumb "Home", :root_path, except: [:index]
  def index
    @dashboard_links = [
        # ['Nutrición', "Acceso al servicio de nutrición.", nutrition_path],
        ['Físico', "Acceso al servicio de mediciones y evaluaciones.", physical_path],
        # ['Dashboard Training', "Acceso al servicio de entrenamientos.", dashboard_training_path],
        ['Entrenamientos', "Acceso al servicio de entrenamientos.", trainings_path],
        ['Ejercicios', "Acceso al listado de ejercicios.", exercises_path]
    ]
  end

  def profile
  end

  def physical
    # add_breadcrumb "Físico", :physical_path
  end

  def nutrition
    # add_breadcrumb "Nutrición", :nutrition_path
  end

  def training
    # add_breadcrumb "Entrenamiento", :dashboard_training_path
  end
end
