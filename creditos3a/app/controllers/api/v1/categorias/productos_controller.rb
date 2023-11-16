class Api::V1::Categorias::ProductosController < ApplicationController
  before_action :set_categoria
  before_action :set_producto
  before_action :authenticate_user!

  def index
    @productos = @categoria.productos
    render json: @productos
  end

  def show
    render json: @productos
  end

  def create
    @producto = Producto.new(producto_params)
    @producto.categoria = @categoria

    if @producto.save
      render json: @producto, status: :created
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  def update
    if @producto.update(producto_params)
        render json: @producto
    else
      render json: @producto.errors status: :unprocessable_entity
    end
  end

  def destroy
    @producto.destroy
    head :no_content
  end


  private

  def set_categoria
    @categoria = Categoria.find(params[:categoria_id])
  end

  def set_producto
    @producto = @categoria.productos.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(:nombre, :descripcion, :precio, :avatar)
  end
end
