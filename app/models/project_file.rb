class ProjectFile < ActiveRecord::Base
  attr_accessible :file, :project_id
  belongs_to :project
  mount_uploader :file, ProjectFileUploader
end
