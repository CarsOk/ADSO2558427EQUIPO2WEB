class CategoriasController < ApplicationController
    layout 'admin'
    def index
      @categorias = Categoria.all
    end

    def new
    @categoria = Categoria.new
    end

    def show
    @categoria = Categoria.find(params[:id])
    @productos = @categoria.productos
    end   

    def edit
    @categoria = Categoria.find(params[:id])
    end

    def create
    @categoria = Categoria.new(categoria_params)
    if @categoria.save 
      redirect_to categorias_path
    else
      render :new
    end
    end

    def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update(categoria_params)
      redirect_to categoria_path(@categoria)
    else
      render :edit
    end
    end

    def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    if @categoria.destroy
        redirect_to categorias_path
    else
        render :index
    end
    end

    
    private

    def categoria_params
    params.require(:categoria).permit(:id, :nombre, :producto_id, :producto_nombre, :producto_descripcion, :producto_file, :producto_avatar)
    end
end
