# encoding: utf-8

class ProjectFileUploader < CarrierWave::Uploader::Base

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  include CarrierWave::MimeTypes
  process :set_content_type

  if Rails.env.production? and Configuration[:aws_access_key]
    include CarrierWaveDirect::Uploader
  else
    storage :file
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(pdf jpg jpeg gif png zip doc docx xls xlsx ppt pptx pps ppsx)
  end

end