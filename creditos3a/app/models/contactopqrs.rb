class Contactopqrs < ApplicationRecord
  validates :nombre, presence: true
  validates :email, presence: true
  validates :asunto, presence: true
  validates :mensaje, presence: true
end
