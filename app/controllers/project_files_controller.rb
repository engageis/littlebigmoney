class ProjectFilesController < ApplicationController
  respond_to :html, :js

  def index
    respond_with @project_files = ProjectFile.all
  end

  def create
    @project_file = ProjectFile.new(params[:project_file])
    @project_file.save
    render :action => 'create.js.erb'
  end
end