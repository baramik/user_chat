require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:messages) }
  it { is_expected.to have_many(:chat_rooms) }
  it { is_expected.to validate_presence_of(:dialect) }

  describe '#name' do
    let(:user) { create(:user) }
    it { expect(user.name).to eq(user.email.split('@')[0]) }
  end

  describe '#is_online?' do
    let(:user) { create(:user, online: true) }

    it 'checks if user is online' do
      expect(user.is_online?).to eq(true)
    end
  end
end
