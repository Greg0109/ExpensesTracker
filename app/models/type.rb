class Type < ApplicationRecord
  validates :name, presence: true, format: { with: /[a-zA-Z]/, message: 'Input invalid.' }, length: { maximum: 20 }
  validates :budget, format: { with: /\A\d+\z/, message: 'Input invalid.' }

  has_one_attached :icon, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, class_name: 'Expense', foreign_key: 'type_id', dependent: :destroy
end
