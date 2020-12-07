class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :order
  has_one :company
  has_one :company_detail
  has_one :company_type
  has_one :company_correspondence
  has_one :company_status
end
