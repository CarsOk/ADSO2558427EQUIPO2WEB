class Admin::Categorias::CatalogosController < ApplicationController
    layout 'admin'
    before_action :set_categoria
    before_action :set_catalogo, only: [:show, :edit, :update, :destroy]
  
    def new
      @catalogo = Catalogo.new
    end
  
    def create
      @catalogo = Catalogo.new(catalogo_params)
      if @catalogo.save
        redirect_to admin_categoria_path(@categoria), notice: 'Catálogo creado exitosamente.'
      else
        render :new
      end
    end

    def edit
    end
  
    private
  
    def set_categoria
      @categoria = Categoria.find(params[:categoria_id])
    end
  
    def set_catalogo
      @catalogo = Catalogo.find(params[:id])
    end
  
    def catalogo_params
      params.require(:catalogo).permit(:nombre)
    end
end
