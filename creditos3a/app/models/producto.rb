class Producto < ApplicationRecord
    has_many :pedidos
    has_many :calificaciones
    has_many :contactopqrs
   
    belongs_to :categoria
    mount_uploader :avatar, AvatarUploader
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :categoria, presence: true
    validates :avatar, presence: true
    def calificaciones
      Calificacion.where(producto_id: id)
    end
    
    def rating_average
        if calificaciones.any?
          total_ratings = calificaciones.sum(:rating)
          total_ratings / calificaciones.count.to_f
        else
          0
        end
      end
end
