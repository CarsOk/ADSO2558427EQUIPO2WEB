class Categorias::ProductosController < ApplicationController
  layout 'admin'
  before_action :set_categoria

  def index
    @productos = @categoria.productos
  end

  def new
    @producto = @categoria.productos.new
  end

  def create
    @producto = Producto.new(producto_params)
    if @producto.save 
      redirect_to categoria_productos_path
    else
      render :new
    end
  end

  def show
    @producto = @categoria.productos.find(params[:id])
  end

  def edit
    @producto = @categoria.productos.find(params[:id])
  end

  def update
    @producto = @categoria.productos.find(params[:id])
    if @producto.update(producto_params)
        redirect_to categoria_producto_path(@categoria, @producto)
    else
        render :edit
    end
  end

  def destroy
    @producto = @categoria.productos.find(params[:id])
    @producto.destroy

    if @producto.destroy
      redirect_to categoria_productos_path(@categoria)
    else
      render :index
    end
  end

  private

  def producto_params
    params.require(:producto).permit(:id, :nombre, :descripcion, :avatar, :categoria_id)
  end

  def set_categoria
    @categoria = Categoria.find(params[:categoria_id])
  end
end
