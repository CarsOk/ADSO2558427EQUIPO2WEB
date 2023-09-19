class Categoria < ApplicationRecord
    has_many :productos, dependent: :destroy
    belongs_to :catalogo, optional: true
    validates :nombre, presence: true

end