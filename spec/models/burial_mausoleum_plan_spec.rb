require 'rails_helper'

RSpec.describe BurialMausoleumPlan do
  before { @mausoleum_plan = FactoryGirl.build(:burial_mausoleum_plan) }

  subject { @mausoleum_plan }

  it { should belong_to(:burial_plan) }
  it { should validate_presence_of(:burial_plan) }
  it { should be_valid }
end
