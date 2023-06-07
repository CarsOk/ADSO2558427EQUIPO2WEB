class ContactopqrsMailer < ApplicationMailer
default from: 'creditos3a@gmail.com'

  def enviar_pqrs(pqrs)
    @pqrs = pqrs
    mail(to: 'breinermora67@gmail.com', subject: 'Nuevo PQRS')
  end
end
