require 'rails_helper'

RSpec.describe Passing do
  before { @passing = FactoryGirl.build(:passing) }

  subject { @passing }

  it { should belong_to(:user) }

  it { should be_valid }
  it { should validate_presence_of(:user) }
  it { should have_many(:burial_plans) }
  it { should have_many(:cremation_plans) }
  it { should have_many(:burial_cemetery_plans).through(:burial_plans) }
  it { should have_many(:burial_mausoleum_plans).through(:burial_plans) }
  it { should have_one(:passing_address) }

  describe '#burial_plans association' do
    before do
      @passing.save
      3.times { FactoryGirl.create :burial_plan, passing: @passing}
    end

    it 'destroys the associated burial plans on self destruct' do
      burial_plans = @passing.burial_plans
      @passing.destroy
      burial_plans.each do |bp|
        expect(BurialPlan.find(bp).to raise_error ActiveRecord::RecordNotFound )
      end
    end
  end

  describe '#cremation_plans association' do
    before do
      @passing.save
      3.times { FactoryGirl.create :cremation_plan, passing: @passing}
    end

    it 'destroys the associated cremation plans on self destruct' do
      cremation_plans = @passing.cremation_plans
      @passing.destroy
      cremation_plans.each do |cp|
        expect(CremationPlan.find(cp).to raise_error ActiveRecord::RecordNotFound )
      end
    end
  end

  describe '#passing_address association' do
    before do
      @passing.save
      @passing.create_passing_address(FactoryGirl.attributes_for(:address))
    end
    let(:passing_address) { @passing.passing_address }
    subject { passing_address }
    it { should be_valid }
    it { should respond_to(:addressable).with @passing.id }

    it 'destroys the associated address on self destruct' do
      address = @passing.passing_address
      @passing.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end

end
