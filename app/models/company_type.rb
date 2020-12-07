class CompanyType < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :industry_type
  end
end
