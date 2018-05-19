class Info < ApplicationRecord
  belongs_to :user
  validates :phone_number , :name ,presence: true , uniqueness: true
end
