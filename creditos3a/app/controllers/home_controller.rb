class HomeController < ApplicationController
  def dashboard
  end
  def landing_page
    @productos_ultimos = Producto.last(4)
  end
end
