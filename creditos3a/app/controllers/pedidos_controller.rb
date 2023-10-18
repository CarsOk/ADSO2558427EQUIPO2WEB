class PedidosController < ApplicationController
    before_action :authenticate_user! # Asegura que solo los usuarios autenticados pueden acceder
    def new
        @producto = Producto.find(params[:producto_id])
        @pedido = current_user.pedidos.build(producto: @producto)
    end

    
    
      # Acción para crear una solicitud de producto
      def create
        @producto = Producto.find(params[:pedido][:producto_id])
        @pedido = @producto.pedidos.build(user: current_user)
        @pedido.comentarios = params[:pedido][:comentarios]
        @pedido.metodo_pago = params[:pedido][:metodo_pago]
      
        if @pedido.save
          # Lógica para el éxito de la solicitud
          redirect_to pedidos_realizados_pedidos_path 
        else
          # Lógica para el manejo de errores
          render :new
        end
      end
      

    def pedidos_realizados
        @pedidos = current_user.pedidos
    end
    
    private
    def pedido_params
      params.require(:pedido).permit(:comentarios, :metodo_pago)
    end
    
end
