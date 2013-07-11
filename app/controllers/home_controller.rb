class HomeController < ApplicationController
  def index
    # Highlighted projects
    # TODO @GG add correct filter here!
    @projects = Project.limit(4)
  end
end
