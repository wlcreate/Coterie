class Meeting < ApplicationRecord
  belongs_to :subcategory
  belongs_to :category
  belongs_to :user #hosts
  has_many :registrations
  has_many :users, through: :registrations #attendees


  def datetime
    self.time.to_formatted_s(:rfc822) 
  end




end
