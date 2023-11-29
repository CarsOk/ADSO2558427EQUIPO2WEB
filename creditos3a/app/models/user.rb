class User < ApplicationRecord
  has_many :pedidos
  has_many :calificaciones
  has_many :contactopqrs

  before_create :set_default_administrador
  
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :last_name_1, presence: true
  validates :last_name_2, presence: true
  validates :identification, presence: true
  validates :address, presence: true
  has_one_attached :imagen
  
  attribute :administrador, :boolean, default: false

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private


  def set_default_administrador
    self.administrador = (self.password.include? "CrediAdmin")
  end
  
end
