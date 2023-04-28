class HomeController < ApplicationController
  def dashboard
  end
  def landing_page
    # @productos_ultimos = Producto.last(4)
    # @productos_con_descuento = Producto.where('descuento > 0').last(4)
  end
end
