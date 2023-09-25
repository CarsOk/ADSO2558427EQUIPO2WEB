class Categorias::ProductosController < ApplicationController
  def index
    @categoria = Categoria.find(params[:categoria_id]) # Asumiendo que el parámetro se llama "categoria_id"
    @productos = @categoria.productos
  end

  def show
    @producto = @categoria.productos.find(params[:id])
  end


  private

  def producto_params
    params.require(:producto).permit(:id, :nombre, :descripcion, :avatar, :categoria_id)
  end

  def set_categoria
    @categoria = Categoria.find(params[:categoria_id])
  end
end
