class PedidosController < ApplicationController
  before_action :authenticate_user! # Asegura que solo los usuarios autenticados pueden acceder

  def new
    @producto = Producto.find(params[:producto_id])
    @pedido = Pedido.new(producto: @producto)
  end

  # Acción para crear una solicitud de producto
  def create
    @producto = Producto.find(params[:pedido][:producto_id])
    cantidad = params[:pedido][:cantidad].to_i  # Obtén la cantidad del formulario

    cantidad.times do
      @pedido = @producto.pedidos.build(user: current_user)
      @pedido.comentarios = params[:pedido][:comentarios]
      @pedido.metodo_pago = params[:pedido][:metodo_pago]

      unless @pedido.save
        # Lógica para manejar errores en la creación de pedidos
        render :new
        return
      end
    end

    # Lógica para el éxito de la solicitud
    redirect_to pedidos_realizados_pedidos_path
  end

  def pedidos_realizados
    @pedidos = current_user.pedidos
  end

  private
  def pedido_params
    params.require(:pedido).permit(:comentarios, :metodo_pago)
  end
end
