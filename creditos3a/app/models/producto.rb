class Producto < ApplicationRecord
    has_many :pedidos
    has_many :calificaciones
    has_many :contactopqrs
    belongs_to :categoria

    before_save :set_disponible
    mount_uploader :avatar, AvatarUploader
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :categoria, presence: true
    validates :avatar, presence: true

    validates :cantidad, numericality: { greater_than_or_equal_to: 0 }
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

private

  def set_disponible
    if cantidad.zero?
      self.disponible = false
    end
  end
end
