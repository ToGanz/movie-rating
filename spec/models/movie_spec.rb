require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:user) { FactoryBot.create(:user) }
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

  context '.rated_by_user?' do
    it 'returns true when rated' do
      subject.ratings.create(user: user, user_rating: 5)
      expect(subject.rated_by_user?(user)).to eq(true)
    end

    it 'returns false when not rated' do
      expect(subject.rated_by_user?(user)).to eq(false)
    end
  end

  context '.rating_by_user' do
    it 'returns the correct rating when rated' do
      subject.ratings.create(user: user, user_rating: 5)
      expect(subject.rating_by_user(user).user_rating).to eq(5)
    end

    it 'returns false when not rated' do
      expect(subject.rating_by_user(user)).to eq(nil)
    end
  end
end
