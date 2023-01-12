class Agenda < ApplicationRecord
    # belongs to user
    belongs_to :user

    enum priority: { low: 1, medium: 2, high: 3, urgent: 4, critical: 5 }

    validates :title, presence: true, length: { minimum: 5 }
    validates :desc, presence: true, length: { minimum: 10 }
    validates :priority, presence: true, inclusion: {
        in: priorities.keys,
        message: "%{value} is not a valid priority"
    }  
end
