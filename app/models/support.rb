class Support < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :support_person
  belongs_to :prefecture

  with_options presence: true do
    validates :support_title
    validates :prefecture_id
    validates :support_delivery_date_first
    validates :support_delivery_date_end
    validates :industry_type
    validates :support_person_id
    validates :termination
    validates :feature
    validates :budget
    validates :support_pr
  end
end
