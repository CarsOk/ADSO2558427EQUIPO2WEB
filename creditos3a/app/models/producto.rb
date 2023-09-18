class Producto < ApplicationRecord
    belongs_to :categoria
    mount_uploader :avatar, AvatarUploader
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :categoria, presence: true
    validates :avatar, presence: true
end
