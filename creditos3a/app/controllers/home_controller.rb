class HomeController < ApplicationController

  def landing_page
    @productos_ultimos = Producto.first(20)
    @categorias = Categoria.all
    @productos = Producto.all.order(rating_average: :desc).limit(5)

  end

  def contacto
  end

end
