class Producto < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
end
