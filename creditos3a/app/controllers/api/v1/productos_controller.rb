class Api::V1::ProductosController < ApplicationController

    def index
        @productos = Producto.all
        render json: @productos
    end
    
    def show
        @producto = Producto.find(params[:id])
        render json: @producto
    end
      
 private
   
    def producto_params
        params.require(:producto).permit(:nombre, :descripcion, :precio, :avatar, :disponible,)
    end
end
