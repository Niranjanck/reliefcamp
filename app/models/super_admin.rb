class SuperAdmin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :email, uniqueness: true
         validates :phone, uniqueness: true,
         numericality:true,:presence => true,:length =>{:minimum=>10} ,:length=>{:maximum=>10}

end
