class ProjectCase < ApplicationRecord
  belongs_to :company
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
 
  with_options presence: true do
    validates :status
  end


end
