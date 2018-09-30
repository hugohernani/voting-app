require "rails_helper"

describe Account, type: :model do
  context 'Associations' do
    it { is_expected.to have_and_belong_to_many(:roles) }
  end
end
