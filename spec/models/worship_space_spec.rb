require 'rails_helper'

RSpec.describe WorshipSpace do
  let(:worship_space) {FactoryGirl.build(:worship_space) }


  subject { worship_space }
  it { should have_one(:address) }
  it { should be_valid }
  it { should accept_nested_attributes_for(:address) }
  it { should validate_presence_of(:name) }


  describe '#address association' do
    before do
      worship_space.save
      worship_space.create_address(FactoryGirl.attributes_for(:address))
    end
    let(:address) { worship_space.address }
    subject { address }
    it { should be_valid }
    it { should respond_to(:addressable).with worship_space.id }

    it 'should destroy the associated address on self destruct' do
      worship_space.save
      worship_space.destroy
      expect{Address.find(address.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
