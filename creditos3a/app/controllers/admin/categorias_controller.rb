class Admin::CategoriasController < Admin::AdminController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :show, :edit, :create, :update, :destroy]
  

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
    
    if @categoria.save
      flash[:success] = 'Categoría creada exitosamente.'
      redirect_to admin_categorias_path
    else
      render :new
    end
  end

  def update

    if @categoria.update(categoria_params)
      redirect_to admin_categoria_path(@categoria)
    else
      render :edit
    end
  end

  def destroy
    if current_user.administrador?

    @categoria = categoria.find(params[:id])
    @categoria.destroy
    else
    end
  end

  private

  def set_categoria
    @categoria = Categoria.find(params[:id])
  end

  def categoria_params
    params.require(:categoria).permit(:id, :nombre, :imagen, :producto_id, :catalogo_id, :producto_nombre, :producto_descripcion, :producto_file, :producto_avatar)
  end
  def authorize
    if current_user.administrador?
      # El usuario es administrador, por lo que se le permite acceder a la página
      
    else
      # El usuario no es administrador, por lo que se le redirige a la página del cliente
      redirect_to cliente_root_path, alert: 'Solo los administradores pueden acceder a esta página.'
    end
  end

end