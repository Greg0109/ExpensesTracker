class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user, class_name: 'User'
  has_one :type, through: :user, class_name: 'Type', source: :types, dependent: :destroy
end
