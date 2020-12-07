class CompanyStatus < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :status
  end

end
