class Admin::CategoriasController < Admin::AdminController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  def index
    @categorias = Categoria.all
  end

  def new
    @categoria = Categoria.new
  end

  def show
    @productos = @categoria.productos
  end

  def edit
  end

  def create
    @categoria = Categoria.new(categoria_params)
    authorize :admin_categories?

    if @categoria.save
      flash[:success] = 'Categoría creada exitosamente.'
      redirect_to admin_categorias_path
    else
      render :new
    end
  end

  def update
    authorize :admin_categories?

    if @categoria.update(categoria_params)
      redirect_to admin_categoria_path(@categoria)
    else
      render :edit
    end
  end

  def destroy
    authorize :admin_categories?

    if @categoria.destroy
      redirect_to admin_categorias_path
    else
      render :index
    end
  end

  private

  def set_categoria
    @categoria = Categoria.find(params[:id])
  end

  def categoria_params
    params.require(:categoria).permit(:id, :nombre, :imagen, :producto_id, :catalogo_id, :producto_nombre, :producto_descripcion, :producto_file, :producto_avatar)
  end

  def check_admin
    unless current_user.administrador?
      redirect_to root_path, alert: 'No tienes permisos para acceder a esta página.'
    end
  end
end