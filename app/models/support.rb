class Support < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :support_person
end
