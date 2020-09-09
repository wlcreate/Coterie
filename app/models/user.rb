class User < ApplicationRecord
    has_many :meetings, dependent: :destroy #this is the host
    has_many :registrations
    has_many :meetings, through: :registrations, dependent: :destroy #this is the attendee

    has_secure_password

   PASSWORD_REQUIREMENTS = /\A 
        (?=.{6,})
        (?=.*\d)
    /x
    
    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :username, presence: true, uniqueness: true, length: { minimum: 2 }
    validates :password, presence: true, format: { with: PASSWORD_REQUIREMENTS } #length: { in: 6..20 }
    validates :bio, length: { maximum: 500 }

    def full_name
        self.first_name + " " + self.last_name
    end


 





end
