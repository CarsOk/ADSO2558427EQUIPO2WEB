class Producto < ApplicationRecord
    has_many :pedidos
    belongs_to :categoria
    mount_uploader :avatar, AvatarUploader
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :categoria, presence: true
    validates :avatar, presence: true
end
