require 'sidekiq/web'

Catarse::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  check_user_admin = lambda { |request| request.env["warden"].authenticate? and request.env['warden'].user.admin }
  constraints check_user_admin do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Non production routes
  if Rails.env == "development"
    resources :emails, :only => [ :index ]
  end

  mount CatarsePaypalExpress::Engine => "/", :as => "catarse_paypal_express"
  # mount CatarsePagosonline::Engine => "/", :as => "catarse_pagosonline"
  # mount CatarseMoip::Engine => "/", :as => "catarse_moip"

  filter :locale, exclude: /\/auth\//
  
  scope "/:kind", :kind => /donate|invest/ do

    root to: 'projects#index', as: :kind

    match "/guidelines_tips" => "static#guidelines_tips", :as => :guidelines_tips
    match "/guidelines_start" => "static#guidelines_start", :as => :guidelines_start
    
    resources :projects do
      resources :updates, only: [ :index, :create, :destroy ]
      resources :rewards, only: [ :index, :create, :update, :destroy ]
      resources :project_files, only: [ :index, :create ]
      resources :possible_investors, only: [ :create, :update, :destroy ]
      resources :backers, controller: 'projects/backers', only: [ :index, :show, :new, :create ] do
        member do
          match 'credits_checkout'
          post 'update_info'
        end
      end
      collection do
        get 'vimeo'
        get 'check_slug'
      end
      member do
        put 'pay'
        get 'embed'
        get 'video_embed'
      end
    end
    
    match "/reward/:id" => "rewards#show", :as => :reward
    match "/:permalink" => "projects#show", as: :project_by_slug
  end

  root to: 'home#index'
  
  # Static Pages
  match '/sitemap' => "static#sitemap", :as => :sitemap
  match "/guidelines" => "static#guidelines", :as => :guidelines
  match "/guidelines_backers" => "static#guidelines_backers", :as => :guidelines_backers
  match "/about" => "static#about", :as => :about
  match "/faq" => "static#faq", :as => :faq
  
  namespace :reports do
    resources :backer_reports_for_project_owners, only: [:index]
  end
  
  resources :users do
    resources :backers, :only => [:index]
    resources :unsubscribes, :only => [:create]
    member do
      get 'projects'
      get 'credits'
      put 'unsubscribe_update'
      put 'update_email'
      put 'update_password'
    end
  end
  match "/users/:id/request_refund/:back_id" => 'users#request_refund'
  
  namespace :adm do
    resources :projects, only: [ :index, :update ] do
      member do
        put 'approve'
        put 'reject'
        put 'push_to_draft'
      end
    end
  
    resources :financials, only: [ :index ]
  
    resources :backers, only: [ :index, :update ] do
      member do
        put 'confirm'
        put 'unconfirm'
        put 'change_reward'
      end
    end
  
    resources :users, only: [ :index ]
    namespace :reports do
      resources :backer_reports, only: [ :index ]
    end
  end

end
