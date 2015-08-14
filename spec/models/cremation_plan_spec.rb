require 'rails_helper'

RSpec.describe CremationPlan do
  before { @cremation_plan = FactoryGirl.build(:cremation_plan) }

  subject { @cremation_plan }

  it { should belong_to(:passing) }
  it { should have_many(:plan_dates) }
  it { should have_one(:service_space_address) }
  it { should have_one(:ash_storage_address) }
  it { should have_one(:ash_delivery_address)}
  it { should validate_presence_of(:passing) }
  it { should accept_nested_attributes_for(:plan_dates) }
  it { should accept_nested_attributes_for(:service_space_address) }
  it { should accept_nested_attributes_for(:ash_storage_address) }
  it { should accept_nested_attributes_for(:ash_delivery_address) }



  describe '#plan_dates association' do
    before do
      @cremation_plan.save
      3.times { FactoryGirl.create :plan_date, dateable: @cremation_plan}
    end

    it 'destroys the associated plan dates on self destruct' do
      dates = @cremation_plan.plan_dates
      @cremation_plan.destroy
      dates.each do |date|
        expect(PlanDate.find(date)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#service_space_address association' do
    before do
      @cremation_plan.save
      @cremation_plan.create_service_space_address(FactoryGirl.attributes_for(:address))
    end

    let(:service_space_address) { @cremation_plan.service_space_address }
    subject { service_space_address }

    it { should be_valid }
    it { should respond_to(:addressable).with @cremation_plan.id }

    it 'destroys the associated service_space_address on self destruct' do
      address = @cremation_plan.service_space_address
      @cremation_plan.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe '#ash_storage_address association' do
    before do
      @cremation_plan.save
      @cremation_plan.create_ash_storage_address(FactoryGirl.attributes_for(:address))
    end

    let(:ash_storage_address) { @cremation_plan.ash_storage_address
     }
    subject { ash_storage_address }
    it { should be_valid }
    it { should respond_to(:addressable).with @cremation_plan.id }

    it 'destroys the associated service_space_address on self destruct' do
      address = @cremation_plan.ash_storage_address
      @cremation_plan.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe '#ash_delivery_address association' do
    before do
      @cremation_plan.save
      @cremation_plan.create_ash_delivery_address(FactoryGirl.attributes_for(:address))
    end
    let(:ash_delivery_address) { @cremation_plan.ash_delivery_address }
    subject { ash_delivery_address }
    it { should be_valid }
    it { should respond_to(:addressable).with @cremation_plan.id }

    it 'destroys the associated service_space_address on self destruct' do
      address = @cremation_plan.ash_delivery_address
      @cremation_plan.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end

