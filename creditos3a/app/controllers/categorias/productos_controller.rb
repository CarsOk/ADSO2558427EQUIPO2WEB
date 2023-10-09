class Categorias::ProductosController < ApplicationController
  def index
    @categoria = Categoria.find(params[:categoria_id]) # Asumiendo que el parámetro se llama "categoria_id"
    @productos = @categoria.productos
  end

  def show
  @producto = Producto.find(params[:id])
  @categoria = @producto.categoria
  @productos_relacionados = @categoria.productos.where.not(id: @producto.id).limit(3)
  end


  private

  def producto_params
    params.require(:producto).permit(:id, :nombre, :descripcion, :precio, :avatar, :categoria_id)
  end

  def set_categoria
    @categoria = Categoria.find(params[:categoria_id])
  end
end
