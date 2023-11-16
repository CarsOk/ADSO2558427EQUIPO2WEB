class Api::V1::CategoriasController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  def index
    @categorias = Categoria.all
    render json: @categorias
  end

  def show
    render json: @categorias
  end

  def create
    @categoria = Categoria.new(categoria_params)
    if @categoria.save
      render json: @categoria, status: :created
    else
      render json: @categoria.errors, status: :unprocessable_entity
    end
  end

  def update
    if @categorias.update(categoria_params)
        render json: @categoria
    else
    render json: @categoria.erros, status:unprocessable_entity
    end
 end

 def destroy
    @categoria.destroy
    head :no_content
 end

  private

  def set_categoria
    @categoria = Categoria.find(params[:id])
  end

  def categoria_params
    params.require(:categoria).permit(:nombre, :imagen) # Ajusta los atributos según tus necesidades.
  end
end
end
