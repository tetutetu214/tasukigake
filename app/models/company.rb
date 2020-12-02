class Company < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :companies_name
    validates :postal_code
    validates :prefecture_id
    validates :first_name_kana
  end
end
