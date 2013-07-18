class HomeController < ApplicationController
  def index
    # Highlighted projects
    # TODO @GG add correct filter here!
    @projects = Project.limit(4)
    @donate_banner_projects = Project.by_kind(:donate).limit(3)
    @invest_banner_projects = Project.by_kind(:invest).limit(3)
  end

end
