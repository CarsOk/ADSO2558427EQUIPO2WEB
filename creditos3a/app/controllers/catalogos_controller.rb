class CatalogosController < ApplicationController
  def index
    @catalogos = Catalogo.all 
    @categorias = Categoria.all
    if params[:catalogo_id].present? && params[:categoria_id].present?
      @catalogo = Catalogo.find(params[:catalogo_id])
      @categoria = Categoria.find(params[:categoria_id])
      @productos = @categoria.productos
    else
     
    end
  end
  
  
  def show
    
    @catalogos = Catalogo.find(1)
    @categorias = @catalogos.categorias.includes(:productos) 
  end
  
end
