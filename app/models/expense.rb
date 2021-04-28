class Expense < ApplicationRecord
    validates_presence_of :name, presence: true
    validates_presence_of :amount, presence: true

    belongs_to :user, class_name: 'User'
    has_one :type, through: :user, class_name: 'Type', source: :types, dependent: :destroy
end
