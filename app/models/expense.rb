class Expense < ApplicationRecord
  validates :name, presence: true, format: { with: /[a-zA-Z]/, message: 'Input invalid.' }, length: { maximum: 20 }
  validates :amount, presence: true, format: { with: /\A\d+\z/, message: 'Input invalid.' }

  belongs_to :user, class_name: 'User'
  has_one :type, through: :user, class_name: 'Type', source: :types, dependent: :destroy
end
