require 'rails_helper'

RSpec.describe PlanDate do
  let(:plan_date) { FactoryGirl.build(:plan_date) }
  subject { plan_date }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:dateable) }
  it { should_not be_valid }

  describe '#dateable association' do

    context 'for burial_plan' do
      let(:plan_date) { FactoryGirl.create :plan_date, :burial_plan_date }
      let(:burial_plan) { plan_date.dateable }

      subject { plan_date }
      it { should respond_to(:dateable).with burial_plan.id }
      it { should be_valid }
      it 'should be an instance of BurialPlan' do
        expect(burial_plan).to be_a BurialPlan
      end
    end

    context 'for cremation_plan' do
      let(:plan_date) { FactoryGirl.create :plan_date, :cremation_plan_date }
      let(:cremation_plan) { plan_date.dateable }
      subject { plan_date }
      it { should respond_to(:dateable).with cremation_plan.id }
      it { should be_valid }
      it 'should be an instance of CremationPlan' do
        expect(cremation_plan).to be_a CremationPlan
      end
    end
  end
end
