class Admin::Categorias::ProductosController < Admin::AdminController
    before_action :set_categoria
    before_action :authorize, only: [:index, :show, :edit, :create, :update, :destroy]
  def index
    @productos = @categoria.productos
  end

  def new
    @producto = @categoria.productos.new
  end

  def show
    @producto = @categoria.productos.find(params[:id])
  end

  def create
    @producto = Producto.new(producto_params)
    @producto.categoria = @categoria # Asigna la categoría al producto

    if @producto.save
      redirect_to admin_categoria_productos_path(@categoria)
    else
      render :new
    end
  end

  def edit
    @producto = @categoria.productos.find(params[:id])
  end

  def update
    @producto = @categoria.productos.find(params[:id])

  if @producto.update(producto_params)
    # Si la cantidad es 0, establece el estado del producto como no disponible
    if @producto.cantidad.zero?
      @producto.disponible = false
      @producto.save

      redirect_to admin_categoria_productos_path(@categoria)
    else
      # Redirige a la página de edición del producto
      redirect_to admin_categoria_productos_path(@categoria)
    end
  else
    render :edit
  end
  end

  def destroy
    @producto = @categoria.productos.find(params[:id])
    @producto.destroy

    redirect_to admin_categoria_productos_path(@categoria)
  end

  private

  def producto_params
    params.require(:producto).permit(:id, :nombre, :descripcion, :precio, :avatar, :categoria_id, :disponible, :cantidad)
  end

  def set_categoria
    @categoria = Categoria.find(params[:categoria_id])
  end
  def authorize
    if current_user.super_admin? || current_user.administrador?
      # El usuario es administrador, por lo que se le permite acceder a la página
      
    else
      # El usuario no es administrador, por lo que se le redirige a la página del cliente
      redirect_to cliente_root_path, alert: 'Solo los administradores pueden acceder a esta página.'
    end
  end

end

