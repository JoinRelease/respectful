require 'rails_helper'

RSpec.describe BurialCemeteryPlan do
  before { @cemetery_plan = FactoryGirl.build(:burial_cemetery_plan) }

  subject { @cemetery_plan }

  it { should belong_to(:burial_plan) }
  it { should validate_presence_of(:burial_plan) }
  it { should be_valid }
end
