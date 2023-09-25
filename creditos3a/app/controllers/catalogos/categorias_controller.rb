module Catalogos
   class CategoriasController < ApplicationController
    before_action :set_catalogo

    def index
      @categorias = if params[:categoria_id].present?
                      [Categoria.find(params[:categoria_id])]
                    else
                      Categoria.all
                    end
    end
    
    

    def show
    end

    private

    def set_catalogo
      @catalogo = Catalogo.find(params[:catalogo_id])
    end
   end
end
