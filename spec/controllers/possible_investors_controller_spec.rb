require 'spec_helper'

describe PossibleInvestorsController do
  describe "#create" do
    let(:current_user){ FactoryGirl.create(:user) }
    let(:project){ FactoryGirl.create(:project) }

    before do
      controller.stubs(:current_user).returns(current_user)
      post :create, project_id: project.id, possible_investor: { amount: 100 }
    end

    it { response.should redirect_to(project) }
    it { PossibleInvestor.last.project.should eq project }
    it { PossibleInvestor.last.user.should eq current_user }
    it { PossibleInvestor.last.amount.should eq 100 }
  end
end
