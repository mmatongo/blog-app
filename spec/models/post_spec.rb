require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    subject { FactoryBot.build :post }

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'max title length should be 250 chars' do
      subject.title = 'RoR' * 250
      expect(subject).to_not be_valid
    end

    it 'should not be blank title' do
      subject.title = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer comments counter' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer likes counter' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_comments' do
    subject { FactoryBot.create :post_with_comments, comments_counter: 5 }

    it 'should return 5 posts' do
      expect(subject.recent_comments.length).to be(5)
    end
  end

  describe '#update_count' do
    subject { FactoryBot.build :post }

    it 'should update the users post count' do
      subject.update_count(2)
      expect(subject.user.posts_counter).to be(2)
    end
  end
end
