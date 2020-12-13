class CompanyType < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :industry_type
  end
end
