class PossibleInvestorsController < ApplicationController
  load_and_authorize_resource only: [ :create, :update ]
  inherit_resources
  actions :create, :update, :destroy

  def create
    @possible_investor = PossibleInvestor.new(amount: params[:possible_investor][:amount])
    @possible_investor.user = current_user
    project = Project.find(params[:project_id])
    @possible_investor.project = project
    @possible_investor.save
    respond_with project
  end

  def update
    update! { project_path(@possible_investor.project) }
  end

  def destroy
    Unsubscribe.where(notification_type_id: NotificationType.where(name: 'updates').first, project: Project.find(params[:project_id])).delete
    destroy!
  end
end
