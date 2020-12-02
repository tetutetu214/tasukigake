class CompanyType < ApplicationRecord
  belongs_to :company_detail

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry_rype

  with_options numericality: { other_than: 1 } do
    validates :industry_type_1
  end
  
end
