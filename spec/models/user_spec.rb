require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build :user }

    before { subject.save }

    it 'return a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have posts > 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'recent posts' do
    subject { FactoryBot.create :user_with_posts, posts_counter: 3 }

    it 'return 3 posts' do
      expect(subject.recent_posts.length).to eq(3)
    end
  end
end
