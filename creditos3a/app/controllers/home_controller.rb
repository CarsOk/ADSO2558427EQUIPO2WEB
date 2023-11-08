class HomeController < ApplicationController

  def landing_page
    @productos_ultimos = Producto.first(20)
    @categorias = Categoria.all
    @productos = Producto.all.order(rating_average: :desc).limit(5)
    @producto = @productos_ultimos.first
  end

  def pages_categoria_producto_path(categoria, producto)
    categoria_id = categoria.id
    producto_id = producto.id

    path_to_show = "/pages/categorias/#{categoria_id}/productos/#{producto_id}"
  end

  def contacto
  end
  

end
