class ProjectFilesController < ApplicationController
  inherit_resources
  belongs_to :project

  def create
    create! { project_path(resource.project) }
  end
end