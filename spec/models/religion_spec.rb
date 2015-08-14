require 'rails_helper'

RSpec.describe Religion do
  before { @religion = FactoryGirl.build(:religion) }

  subject { @religion }
  it { should validate_presence_of(:name) }
  it { should be_valid }
end
