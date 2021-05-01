require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Belongs' do
    it { should have_many(:types) }
    it { should have_many(:expenses) }
  end
end
