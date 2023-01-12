class User < ApplicationRecord
    # has many agendas
    has_many :agenda, dependent: :destroy

    validates :email, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: { minimum: 5 }

    def validate_password!(password)
        password == BCrypt::Password.new(self.password)
    end
end
