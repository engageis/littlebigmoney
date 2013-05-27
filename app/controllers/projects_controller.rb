# coding: utf-8
class ProjectsController < ApplicationController
  include ActionView::Helpers::DateHelper

  load_and_authorize_resource only: [ :new, :update, :update, :destroy ]

  inherit_resources
  has_scope :pg_search, :by_category_id, :recent, :expiring, :successful, :recommended, :not_expired, :by_kind, :by_country, :by_area, :by_impact, :by_entrepreneur_type
  respond_to :html, :except => [:backers]
  respond_to :json, :only => [:index, :show, :backers, :update]
  skip_before_filter :detect_locale, :only => [:backers]

  def index
    index! do |format|
      format.html do
        @title = t("site.title")

        @categories = Category.with_projects.order(:name_pt).all

        # Just to know if we should present the menu entries, the actual projects are fetched via AJAX
        @recommended = Project.by_kind(app_context).visible.not_expired.recommended.limit(3)
        @expiring = Project.by_kind(app_context).visible.expiring.limit(3)
        @recent = Project.by_kind(app_context).visible.recent.not_expired.limit(3).order('created_at DESC')
        @successful = Project.by_kind(app_context).visible.successful.limit(3)
      end

      format.json do
        @projects = apply_scopes(Project).by_kind(app_context).visible.order_for_search
        respond_with(@projects.includes(:project_total, :user, :category).page(params[:page]).per(6))
      end
    end
  end

  def new
    new! do
      @title = t('projects.new.title')
      @project.rewards.build
    end
  end

  def create
    params[:project][:expires_at] += (23.hours + 59.minutes + 59.seconds) if params[:project][:expires_at]
    validate_rewards_attributes if params[:project][:rewards_attributes].present?

    user_attributes = params[:project].delete(:user)
    current_user.update_attributes(user_attributes) if current_user.email != user_attributes[:email]
    @project = current_user.projects.new(params[:project])

    create!(:notice => t('projects.create.success')) do |success, failure|
      success.html{ return redirect_to project_by_slug_path(@project.permalink) }
    end
  end

  def update
    update! do
      if @project.investment?
        @title = @project.name
        @rewards = @project.rewards.includes(:project).order(:minimum_value).all
        @backers = @project.backers.confirmed.limit(12).order("confirmed_at DESC").all
        @update = @project.updates.where(:id => params[:update_id]).first if params[:update_id].present?
        @possible_investor = PossibleInvestor.where('user_id = ? and project_id = ?', current_user.id, @project.id).first
        unless @possible_investor
          @possible_investor = PossibleInvestor.new
        end
      end
      return render :show if @project.errors.any?
    end
  end

  def show
    begin
      if params[:permalink].present?
        @project = Project.by_kind(app_context).find_by_permalink!(params[:permalink])
      else
        return redirect_to project_by_slug_path(resource.permalink)
      end

      update_fikes_count

      show!{
        @title = @project.name
        @rewards = @project.rewards.includes(:project).order(:minimum_value).all
        @backers = @project.backers.confirmed.limit(12).order("confirmed_at DESC").all
        fb_admins_add(@project.user.facebook_id) if @project.user.facebook_id
        @update = @project.updates.where(:id => params[:update_id]).first if params[:update_id].present?
        if @project.investment?
          @possible_investor = PossibleInvestor.where('user_id = ? and project_id = ?', current_user.id, @project.id).first
          unless @possible_investor
            @possible_investor = PossibleInvestor.new
          end
        end
      }
    rescue ActiveRecord::RecordNotFound
      return render_404
    end
  end

  def vimeo
    project = Project.new(:video_url => params[:url])
    if project.vimeo.info
      render :json => project.vimeo.info.to_json
    else
      render :json => {:id => false}.to_json
    end
  end

  def check_slug
    # http = Net::HTTP.new("#{root_url}/#{params[:permalink]}",80)
    # response = http.request_head('/')
    # raise response
    # render :json => {:available => response == 404}.to_json
    project = Project.where("permalink = ?", params[:permalink])
    render :json => {:available => project.empty?}.to_json
  end

  def embed
    @project = Project.find params[:id]
    @title = @project.name
    render :layout => 'embed'
  end

  def video_embed
    @project = Project.find params[:id]
    @title = @project.name
    render :layout => 'embed'
  end

  def blog_posts
    Blog.fetch_last_posts.inject([]) do |total,item|
      total << item if total.size < 2
      total
    end
  rescue
    []
  end

  # Just to fix a minor bug,
  # when user submit the project without some rewards.
  def validate_rewards_attributes
    rewards = params[:project][:rewards_attributes]
    rewards.each do |r|
      rewards.delete(r[0]) unless Reward.new(r[1]).valid?
    end
  end

  private
  def update_fikes_count
    begin
      fql = "SELECT total_count FROM link_stat WHERE url='%s'"
      facebook_query_url = "https://api.facebook.com/method/fql.query?format=json&query=#{URI.encode(fql % project_by_slug_url(@project.permalink, :locale => ''))}"
      facebook_data = JSON.parse(open(facebook_query_url).read)
      total_count = facebook_data.first["total_count"]
      @project.update_column(:likes, total_count.to_i) if total_count
    rescue
      Rails.logger.info 'Unable to fetch facebook total likes count'
    end
  end
end
