class Pages::Categorias::ProductosController < ApplicationController
  layout 'modelo', only: [:index, :show]
  include ActionView::Helpers::UrlHelper
  def index
    @categoria = Categoria.find(params[:categoria_id]) # Asumiendo que el parámetro se llama "categoria_id"
    @productos = @categoria.productos
  end

  def show
  @producto = Producto.find(params[:id])
  @categoria = @producto.categoria
  @productos_relacionados = @categoria.productos.where.not(id: @producto.id).limit(3)
  @calificaciones = @producto.calificaciones
  @calificacion = @producto.calificaciones.new
  if @producto.disponible
    # El producto está disponible, por lo que se puede solicitar
    link_to "Solicitar este producto", new_producto_pedido_path(producto_id: @producto.id)
  else
    # El producto no está disponible, por lo que no se puede solicitar
    # Mostrar un mensaje sobrepuesto
    flash[:notice] = "Este producto no está disponible."
  end
  end


  private

  def producto_params
    params.require(:producto).permit(:id, :nombre, :descripcion, :precio, :avatar, :categoria_id)
  end

  def set_categoria
    @categoria = Categoria.find(params[:categoria_id])
  end
end
