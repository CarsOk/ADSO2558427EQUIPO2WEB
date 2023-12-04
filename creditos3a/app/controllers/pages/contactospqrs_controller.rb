class Pages::ContactospqrsController < ApplicationController
  before_action :authenticate_user!


  def new
    @contactopqrs = Contactopqrs.new
    @contactopqrs.nombre = current_user.first_name + " " + current_user.last_name_1
    @contactopqrs.email = current_user.email

    @productos = Producto.all
  end

  def create
    @contactopqrs = current_user.contactopqrs.new(contactopqrs_params)

    if @contactopqrs.save
      redirect_to root_path, notice: 'El formulario PQRS se envió correctamente.'
    else
      render :new
    end
  end

  private

  def contactopqrs_params
    params.require(:contactopqrs).permit(:nombre, :email, :asunto, :mensaje, :producto_id)
  end
end