class ProductoSerializer < ActiveModel::Serializer
    attributes :id, :nombre, :descripcion, :precio, :avatar, :disponible

  def avatar
    object.avatar.attachment.service_url if object.avatar.attached?
  end

  def disponible
    object.disponible?
  end


end
  