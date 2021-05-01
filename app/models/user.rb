class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: {with: /[a-zA-Z]/}, length: {minimum: 5, maximum: 20}
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true

  has_many :types, class_name: :Type, dependent: :destroy
  has_many :expenses, class_name: :Expense, dependent: :destroy
end
