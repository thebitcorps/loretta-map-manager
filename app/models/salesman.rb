class Salesman < ActiveRecord::Base
  has_many :lots, dependent: :nullify
  validates :name, presence: {message: "El nombre no puede quedar en blanco."}
  validates :lastname, presence: {message: "Los apellidos no pueden quedar en blanco."}
end
