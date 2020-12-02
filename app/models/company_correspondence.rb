class CompanyCorrespondence < ApplicationRecord
  belongs_to :company_type
  has_one :company_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :prefecture_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end
end
