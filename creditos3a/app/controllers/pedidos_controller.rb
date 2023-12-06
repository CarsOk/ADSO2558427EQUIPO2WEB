class PedidosController < ApplicationController
  before_action :authenticate_user! 

  def new
    @producto = Producto.find(params[:producto_id])
    @pedido = Pedido.new(producto: @producto)

    if @producto.disponible
    
    else
      
      redirect_to pages_categoria_producto_path(@producto.categoria, @producto)
    end
  end
  def create
    @producto = Producto.find(params[:pedido][:producto_id])
    cantidad = params[:pedido][:cantidad].to_i  # Obtén la cantidad del formulario
  
    if @producto.disponible
      cantidad.times do
        @pedido = @producto.pedidos.build(user: current_user)
        @pedido.comentarios = params[:pedido][:comentarios]
  
        # Actualiza la cantidad del producto
        @producto.cantidad -= 1
  
        # Si la cantidad es 0, establece el estado del producto como no disponible
        if @producto.cantidad.zero?
          @producto.disponible = false
          @producto.save
        end
  
        unless @pedido.save
          # Lógica para manejar errores en la creación de pedidos
          flash[:alert] = "No se pudo crear el pedido."
          redirect_to new_producto_pedido_path(@producto)
          return
        end
      end
  
      # Lógica para el éxito de la solicitud
      redirect_to pedidos_realizados_pedidos_path
    else
      flash[:alert] = "Este producto no está disponible."
      redirect_to producto_path(@producto)
    end
  end

  def pedidos_realizados
    @pedidos = current_user.pedidos
  end

  private

  def pedido_params
    params.require(:pedido).permit(:comentarios)
  end
end