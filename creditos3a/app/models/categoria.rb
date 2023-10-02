class Categoria < ApplicationRecord
    has_many :productos, dependent: :destroy
    belongs_to :catalogo, optional: true
    validates :nombre, presence: true
    has_one_attached :imagen
    def asignar_imagen(imagen)
        self.imagen.attach(imagen)
      end
 
end