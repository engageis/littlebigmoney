class ExploreController < ApplicationController

  def index
    @title = t('explore.title')
    @categories = Category.with_projects.order(:name_pt).all

    # Just to know if we should present the menu entries, the actual projects are fetched via AJAX
    @recommended = Project.by_kind(app_context).visible.not_expired.recommended.limit(3)
    @expiring = Project.by_kind(app_context).visible.expiring.limit(3)
    @recent = Project.by_kind(app_context).visible.recent.not_expired.limit(3).order('created_at DESC')
    @successful = Project.by_kind(app_context).visible.successful.limit(3)
  end

end
