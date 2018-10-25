class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable

  has_one :address, dependent: :destroy
  
  delegate :descriptor, to: :address, prefix: true, allow_nil: true
end
