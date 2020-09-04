class Meeting < ApplicationRecord
  belongs_to :subcategory
  belongs_to :user #hosts
  has_many :registrations
  has_many :users, through: :registrations #attendees
end
