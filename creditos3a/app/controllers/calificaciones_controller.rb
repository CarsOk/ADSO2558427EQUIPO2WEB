class CalificacionesController < ApplicationController
  before_action :authenticate_user!

  # Acción para crear una nueva calificación
  def new
    @producto = Producto.find(params[:producto_id])
    @calificacion = Calificacion.new
  end

 
  def create
    @producto = Producto.find(params[:producto_id])
    @calificacion = @producto.calificaciones.build(calificacion_params)
    @calificacion.user = current_user

    if @calificacion.save
      redirect_to pages_categoria_producto_path(@producto.categoria, @producto)
    else
      render :new
    end
  end

  # Acción para mostrar la lista de calificaciones de un producto
  def index
    @producto = Producto.find(params[:producto_id])
    @calificaciones = @producto.calificaciones
  end

  private

  # Parámetros permitidos para la creación de calificaciones
  def calificacion_params
    params.require(:calificacion).permit(:rating, :review)
  end
end
