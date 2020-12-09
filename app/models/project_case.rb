class ProjectCase < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :project_case_name
    validates :prefecture_id
    validates :project_case_pr
  end
end
