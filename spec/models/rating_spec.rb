require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject { FactoryBot.create(:rating)}

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
