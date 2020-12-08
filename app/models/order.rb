class Order < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :payment

  with_options presence: true do
    validates :order_title
    validates :prefecture_id
    validates :order_delivery_date_first
    validates :order_delivery_date_end
    validates :industry_type
    validates :division
    validates :unit_price
    validates :budget
    validates :payment_id
    validates :order_pr
  end
end
