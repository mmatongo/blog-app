require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_count' do
    subject { FactoryBot.build :like }

    it 'should update the post likes counter' do
      subject.update_count(2)
      expect(subject.post.likes_counter).to be(2)
    end
  end
end
