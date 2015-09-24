require 'rails_helper'

RSpec.describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }
  it { should have_many(:passings) }
  it { should have_many(:burial_plans).through(:passings) }
  it { should have_many(:cremation_plans).through(:passings) }
  it { should have_many(:burial_cemetery_plans).through(:burial_plans) }
  it { should have_many(:burial_mausoleum_plans).through(:burial_plans) }
  it { should have_one(:lead) }

  it { should accept_nested_attributes_for(:passings) }
  it { should accept_nested_attributes_for(:burial_plans) }
  it { should accept_nested_attributes_for(:cremation_plans) }
  it { should accept_nested_attributes_for(:burial_mausoleum_plans) }
  it { should accept_nested_attributes_for(:burial_cemetery_plans) }


  describe '#passings association' do
    before do
      @user.save
      3.times { FactoryGirl.create :passing, user: @user }
    end
    it 'destroys the associated passings on self destruct' do
      passings = @user.passings
      @user.destroy
      passings.each do |p|
        expect(Passing.find(p)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
