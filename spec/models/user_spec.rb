require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
