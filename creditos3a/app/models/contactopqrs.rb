class Contactopqrs < ApplicationRecord
  belongs_to :user
  belongs_to :producto
  
  validates :nombre, presence: true
  validates :email, presence: true
  validates :asunto, presence: true
  validates :mensaje, presence: true


 
end
