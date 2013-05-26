class PossibleInvestorsController < ApplicationController
  load_and_authorize_resource only: [ :create, :update ]
  inherit_resources
  actions :create, :update
  respond_to :json

  def create
    @possible_investor = PossibleInvestor.new(amount: params[:possible_investor][:amount])
    @possible_investor.user = current_user
    @possible_investor.project = Project.find(params[:project_id])
    @possible_investor.save
    render :json => @possible_investor
  end
end
