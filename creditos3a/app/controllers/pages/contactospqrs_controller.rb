class Pages::ContactospqrsController < ApplicationController
  def new
    @contactopqrs = Contactopqrs.new
  end

  def create
    @contactopqrs = Contactopqrs.new(contactopqrs_params)

    if @contactopqrs.save
      ContactopqrsMailer.enviar_pqrs(@contactopqrs).deliver_now
      redirect_to root_path, notice: 'El formulario PQRS se envió correctamente.'
    else
      render :new
    end
  end

  private

  def contactopqrs_params
    params.require(:contactopqrs).permit(:nombre, :email, :asunto, :mensaje)
  end
end
