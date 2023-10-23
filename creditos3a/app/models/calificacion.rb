class Calificacion < ApplicationRecord
  belongs_to :producto
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :review, presence: true
  validates :user, presence: true
end
