class CategoriasController < ApplicationController
    def index
      @categorias = Categoria.all
    end


    def show
    @categoria = Categoria.find(params[:id])
    @productos = @categoria.productos
    end   

    private

    def categoria_params
    params.require(:categoria).permit(:id, :nombre, :producto_id,  :catalogo_id, :producto_nombre, :producto_descripcion, :producto_file, :producto_avatar)
    end
end
