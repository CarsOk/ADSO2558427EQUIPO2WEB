class Pedido < ApplicationRecord
  belongs_to :user
  belongs_to :producto
  validates :user, presence: true
  validates :producto, presence: true
end
