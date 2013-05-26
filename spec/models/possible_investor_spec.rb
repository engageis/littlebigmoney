require 'spec_helper'

describe PossibleInvestor do
  describe 'validations' do
    it { should validate_presence_of :amount }
    it { should validate_presence_of :project }
    it { should validate_presence_of :user }
  end

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :project }
  end
end
