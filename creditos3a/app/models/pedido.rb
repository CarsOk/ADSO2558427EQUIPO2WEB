class Pedido < ApplicationRecord
  belongs_to :user
  belongs_to :producto
 
  validates :user, presence: true
  validates :producto, presence: true
  validates :comentarios, presence: true
  validates :metodo_pago, presence: true
end
