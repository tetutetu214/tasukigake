class CompanyDetail < ApplicationRecord
  belongs_to :company, optional: true
  has_one :company_type
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
