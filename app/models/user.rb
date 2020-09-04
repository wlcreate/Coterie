class User < ApplicationRecord
    has_many :meetings #this is the host
    has_many :registrations
    has_many :meetings, through: :registrations #this is the attendee
end
