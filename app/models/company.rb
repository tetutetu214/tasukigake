class Company < ApplicationRecord
  belongs_to :user
  has_one :company_detail

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :companies_name
    validates :postal_code
    validates :prefecture_id
    validates :first_name_kana
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end
end
