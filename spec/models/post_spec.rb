require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    subject { Post.new(title: 'title', text: 'body', user_id: 0) }

    before { subject.save }

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have a body' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'should have a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'should have a body less than or equal to 250 characters' do
      subject.text = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'should have a title less than or equal to 50 characters' do
      subject.title = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'should have positive likes' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should have positive comments' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should have many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it 'should have many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end

    it 'should belong to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe 'recent comments' do
    subject { Post.first }

    it 'should have 3 recent comments' do
      expect(subject.recent_comments.length).to eq 3
    end
  end

  describe 'update counter' do
    subject { Post.first }

    it 'should update posts counter' do
      subject.update_count(2)
      expect(subject.user.posts_counter).to eq 2
    end
  end
end
