class Producto < ApplicationRecord
    has_many :pedidos
    #has_many :user_products
    #has_many :users, through: :user_products

    belongs_to :categoria
    mount_uploader :avatar, AvatarUploader
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :categoria, presence: true
    validates :avatar, presence: true
end
