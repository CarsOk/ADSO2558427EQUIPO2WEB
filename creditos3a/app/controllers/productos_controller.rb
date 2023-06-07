class ProductosController < ApplicationController
  before_action :authenticate_user!
  def index
  @productos = Producto.all
end

def show
  @producto = Producto.find(params[:id])
end

def new
  @producto = Producto.new
end

def create
  @producto = Producto.new(producto_params)
  if @producto.save
    flash[:notice] = "Registro guardado"
    redirect_to producto_path(@producto)
  else
    flas[:alert] = "Problemas"
    render :new
  end
end

def edit
  @producto = Producto.find(params[:id])
end

def update
  @producto = Producto.find(params[:id])
  if @producto.update(producto_params)
    redirect_to producto_path(@producto)
  else
    render :edit
  end
end

  def delete
  
  end

  private

  def producto_params
    params.require(:producto).permit(:id, :nombre, :descripcion, :cantidad, :avatar)
  end
end
