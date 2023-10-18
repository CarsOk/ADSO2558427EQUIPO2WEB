class User < ApplicationRecord
  has_many :pedidos
  #has_many :user_products
  #has_many :productos, through: :user_products

  before_create :set_default_administrador
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :last_name_1, presence: true
  validates :last_name_2, presence: true
  validates :identification, presence: true
  validates :address, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def set_default_administrador
    self.administrador = false
  end
end
