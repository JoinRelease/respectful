require 'rails_helper'

RSpec.describe Address do
  let(:address) { FactoryGirl.build :address }
  subject { address }
  it { should validate_presence_of(:line1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }
  it { should be_valid }

  describe '#addressable association' do
    context 'for worship_space' do
      let(:worship_address) { FactoryGirl.create :address, :worship_space_address  }
      let(:worship_space) { worship_address.addressable }

      subject { worship_address }
      it { should be_valid }
      it { should respond_to(:addressable).with worship_space.id }
      it 'should be an instance of WorshipSpace' do
        expect(worship_space).to be_a WorshipSpace
      end
    end

    context 'for burial_address' do
      let(:burial_address) { FactoryGirl.create :address, :burial_plan_address  }
      let (:burial_plan) { burial_address.addressable }

      subject { burial_address }
      it { should be_valid }
      it { should respond_to(:addressable).with burial_plan.id }
      it 'should be an instance of BurialPlan' do
        expect(burial_plan).to be_a BurialPlan
      end
    end

    context 'for cremation_address' do
      let(:cremation_address) { FactoryGirl.create :address, :cremation_plan_address  }
      let (:cremation_plan) { cremation_address.addressable }

      subject { cremation_address }
      it { should be_valid }
      it { should respond_to(:addressable).with cremation_plan.id }
      it 'should be an instance of CremationPlan' do
        expect(cremation_plan).to be_a CremationPlan
      end
    end

    context 'for passing_address' do
      let(:passing_address) { FactoryGirl.create :address, :passing_address  }
      let (:passing) { passing_address.addressable }
      subject { passing_address }
      it { should be_valid }
      it { should respond_to(:addressable).with passing.id }
      it 'should be an instance of Passing' do
        expect(passing).to be_a Passing
      end
    end
  end

end
