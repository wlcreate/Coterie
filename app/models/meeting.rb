class Meeting < ApplicationRecord
  belongs_to :subcategory
  belongs_to :category
  belongs_to :user #hosts
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations, dependent: :destroy #attendees


  def datetime
    self.time.strftime("%A %b %d, %Y %H:%M")
  end




end
