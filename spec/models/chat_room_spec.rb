require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it { is_expected.to have_many(:messages) }
end
