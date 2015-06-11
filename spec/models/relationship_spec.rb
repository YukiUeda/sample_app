require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { is_expected.to be_valid }

   describe "follower methods" do
    it { is_expected.to respond_to(:follower) }
    it { is_expected.to respond_to(:followed) }

    describe '#follower' do
      subject { super().follower }
      it { is_expected.to eq follower }
    end

    describe '#followed' do
      subject { super().followed }
      it { is_expected.to eq followed }
    end
  end


  describe "when followed id is no present" do
    before { relationship.followed_id = nil}
    it { is_expected.not_to be_valid }
  end

  describe "when follower id is no present" do
    before { relationship.follower_id = nil}
    it { is_expected.not_to be_valid }
  end

end
