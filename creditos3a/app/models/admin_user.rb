class AdminUser < ApplicationRecord
  before_create :set_default_administrador

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def set_default_administrador
    self.administrador = true
  end   
end
