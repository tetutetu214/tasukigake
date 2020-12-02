class CompanyDetail < ApplicationRecord
  belongs_to :CompanyDetail
  has_one_attached :image

  with_options presence: true do
    validates :division
    validates :representative
    validates :phone_number
    validates  :capital
    validates  :estblishment
    validates  :employee
    validates  :description
  end
end
