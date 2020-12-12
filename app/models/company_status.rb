class CompanyStatus < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :status
  end
end
