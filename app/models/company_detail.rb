class CompanyDetail < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :division
    validates :representative
    validates :phone_number
    validates  :capital
    validates  :establishment
    validates  :employee
    validates  :description
  end
end
