require 'rails_helper'

RSpec.describe Culture do
  before { @culture = FactoryGirl.build(:culture) }

  subject { @culture }
  it { should validate_presence_of(:name) }
  it { should be_valid }
end
