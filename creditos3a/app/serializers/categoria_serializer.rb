class CategoriaSerializer < ActiveModel::Serializer
    attributes :id, :nombre, :imagen
    def imagen
        object.imagen.url
    end
  
end
