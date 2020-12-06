class CompanyType < ApplicationRecord
  belongs_to :company_detail
  has_one :company_correspondence

  with_options presence: true do
    validates :industry_type
  end


end
