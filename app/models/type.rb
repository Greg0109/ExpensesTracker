class Type < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    has_many :expenses, class_name: 'Expense', foreign_key: 'type_id', dependent: :destroy
end
