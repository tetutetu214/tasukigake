class CompanyStatus < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :license
  belongs_to :tool

  with_options presence: true do
    validates :status
  end

  with_options numericality: { other_than: 1 } do
    validates :lidense_id
    validates :tool_id
  end
end
