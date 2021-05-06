require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject { FactoryBot.create(:rating)}

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'user rating is missing' do
    it 'is not valid' do
      subject.update(user_rating: '')
      expect(subject.errors).to have_key(:user_rating)
    end
  end
  
end
