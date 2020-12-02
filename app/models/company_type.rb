class CompanyType < ApplicationRecord
  belongs_to :company_detail
  has_one :company_correspondence

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry_type

  with_options presence: true do
    validates :industry_type_1
  end

  with_options numericality: { other_than: 1 } do
    validates :industry_type_1
    validates :industry_type_2
    validates :industry_type_3
  end
  
end
