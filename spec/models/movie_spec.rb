require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject do
    FactoryBot.create(:movie)
  end

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context '.formatted_date' do
    it 'has the right format' do
      expect(subject.formatted_date).to eq("19.12.1997")
    end
  end
end
