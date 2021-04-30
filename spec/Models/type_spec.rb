require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Belongs' do
    it { should belong_to(:user) }
    it { should have_many(:expenses) }
    it { should have_one_attached(:icon) }
  end
end
