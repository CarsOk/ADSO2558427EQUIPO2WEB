class ApplicationController < ActionController::Base
    before_action :set_catalogo_actual

    private
  
    def set_catalogo_actual
      # Lógica para definir @catalogo_actual aquí
      # Por ejemplo, puedes obtenerlo de la sesión o de otra manera que aplique a tu aplicación
      @catalogo_actual = Catalogo.find(session[:catalogo_id]) if session[:catalogo_id].present?
    end
end
