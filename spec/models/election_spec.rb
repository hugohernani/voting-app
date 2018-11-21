require 'rails_helper'

RSpec.describe Election, type: :model do
  context "validations" do
    [:name, :start_time, :end_time].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
end
