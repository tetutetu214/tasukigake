class Company < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :company_name
    validates :postal_code
    validates :prefecture_id
    
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end
end
