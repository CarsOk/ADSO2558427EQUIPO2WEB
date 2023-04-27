class HomeController < ApplicationController
  def dashboard
  end
  def landing_page
    @productos = Producto.last(4)
  end
end
