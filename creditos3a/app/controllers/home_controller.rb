class HomeController < ApplicationController

  def landing_page
    @productos_ultimos = Producto.first(20)
    @categorias = Categoria.all
  end

  def contacto
  end

end
