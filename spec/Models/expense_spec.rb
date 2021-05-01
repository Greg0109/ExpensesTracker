require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe 'Belongs' do
    it { should belong_to(:user) }
    it { should have_one(:type) }
  end
end
