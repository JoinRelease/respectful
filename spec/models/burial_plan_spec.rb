require 'rails_helper'

RSpec.describe BurialPlan do
  before { @burial_plan = FactoryGirl.build(:burial_plan) }

  subject { @burial_plan }

  it { should belong_to(:passing) }
  it { should have_many(:plan_dates) }
  it { should have_many(:burial_cemetery_plans) }
  it { should have_many(:burial_mausoleum_plans) }
  it { should have_one(:service_space_address) }
  it { should have_one(:burial_space_address) }
  it { should validate_presence_of(:passing) }
  it { should accept_nested_attributes_for(:plan_dates) }
  it { should accept_nested_attributes_for(:service_space_address) }
  it { should accept_nested_attributes_for(:burial_space_address) }

  describe '#plan_dates association' do
    before do
      @burial_plan.save
      3.times { FactoryGirl.create :plan_date, dateable: @burial_plan}
    end

    it 'destroys the associated plan dates on self destruct' do
      dates = @burial_plan.plan_dates
      @burial_plan.destroy
      dates.each do |date|
        expect(PlanDate.find(date)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#burial_mausoleum_plan association' do
    before do
      @burial_plan.save
      3.times { FactoryGirl.create :burial_mausoleum_plan, burial_plan: @burial_plan}
    end

    it 'destroys the associated burial_mausoleum_plans on self destruct' do
      mauso_plans = @burial_plan.burial_mausoleum_plans
      @burial_plan.destroy
      mauso_plans.each do |mp|
        expect(BurialMausoleumPlan.find(mp)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#burial_cemetery_plan association' do
    before do
      @burial_plan.save
      3.times { FactoryGirl.create :burial_cemetery_plan, burial_plan: @burial_plan}
    end

    it 'destroys the associated burial_cemetery_plans on self destruct' do
      cemetery_plans = @burial_plan.burial_cemetery_plans
      @burial_plan.destroy
      cemetery_plans.each do |cp|
        expect(BurialCemeteryPlan.find(cp)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#service_space_address association' do
    before do
      @burial_plan.save
      @burial_plan.create_service_space_address(FactoryGirl.attributes_for(:address))
    end
    let(:service_space_address) { @burial_plan.service_space_address }
    subject { service_space_address }
    it { should be_valid }
    it { should respond_to(:addressable).with @burial_plan.id }

    it 'destroys the associated service_space_address on self destruct' do
      address = @burial_plan.service_space_address
      @burial_plan.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe '#burial_space_address association' do
    before do
      @burial_plan.save
      @burial_plan.create_burial_space_address(FactoryGirl.attributes_for(:address))
    end
    let(:burial_space_address) { @burial_plan.burial_space_address }
    subject { @burial_plan.burial_space_address }

    it { should be_valid }
    it { should respond_to(:addressable).with @burial_plan.id }

    it 'destroys the associated service_space_address on self destruct' do
      address = @burial_plan.burial_space_address
      @burial_plan.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end

    it 'does not have the same address as service_space_address' do
      burial_address = @burial_plan.burial_space_address
      service_address = @burial_plan.service_space_address
      expect(burial_address).not_to eq(service_address)
    end
  end
end
