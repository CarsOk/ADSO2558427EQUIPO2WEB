# app/models/user.rb

class User < ApplicationRecord
  has_many :pedidos
  has_many :calificaciones
  has_many :contactopqrs

  before_create :set_default_administrador
  validates :first_name, :last_name_1, :last_name_2, format: { without: /\d/, message: "no debe contener números" }
  validates :first_name, :last_name_1, :identification, :address, presence: true
  validates :identification, numericality: { only_integer: true }

  validate :validar_identificacion_sin_letras
  validate :validar_telefono_sin_letras
  validate :validar_first_name_sin_numeros
  validate :validar_second_name_sin_numeros
  validate :validar_last_name_2_sin_numeros
  validate :validar_last_name_1_sin_numeros

  # Otras validaciones y asociaciones ...

  has_one_attached :imagen
  
  attribute :administrador, :boolean, default: false

<<<<<<< HEAD
  attribute :super_admin, :boolean, default: false

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
=======
>>>>>>> origin/developer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
 
  def validar_last_name_1_sin_numeros
    if last_name_1.to_s.match?(/\d/)
      errors.add(:last_name_1, "no debe contener números")
    end
  end

  def validar_last_name_2_sin_numeros
    if last_name_2.to_s.match?(/\d/)
      errors.add(:last_name_2, "no debe contener números")
    end
  end
   
  def validar_second_name_sin_numeros
    if second_name.to_s.match?(/\d/)
      errors.add(:second_name, "no debe contener números")
    end
  end
  def validar_first_name_sin_numeros
    if first_name.to_s.match?(/\d/)
      errors.add(:first_name, "no debe contener números")
    end
  end
  def set_default_administrador
    self.super_admin = (self.password.include? "CrediAdmin")
  end

  def validar_telefono_sin_letras
    if telefono.to_s.match?(/[a-zA-Z]/)
      errors.add(:telefono, "no debe contener letras")
    end
  end

  def validar_identificacion_sin_letras
    if identification.to_s.match?(/[a-zA-Z]/)
      errors.add(:identification, "no debe contener letras")
    end
  end
end


