class HomeController < ApplicationController
  

  def landing_page
    @productos_ultimos = Producto.last(4)
    @categorias = Categoria.all
  end

  def contacto
  end

end
