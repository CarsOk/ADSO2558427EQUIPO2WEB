class Producto < ApplicationRecord
    belongs_to :categoria
    mount_uploader :avatar, AvatarUploader
end
