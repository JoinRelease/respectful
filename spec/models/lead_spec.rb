require 'rails_helper'

RSpec.describe Lead do
  before { @lead = FactoryGirl.create(:lead) }

  subject { @lead }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should be_valid }
end
