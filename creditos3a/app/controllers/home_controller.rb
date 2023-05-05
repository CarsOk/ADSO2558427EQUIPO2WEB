class HomeController < ApplicationController

  def landing_page
    @productos_ultimos = Producto.last(4)
  end

  def contacto
  end

end
