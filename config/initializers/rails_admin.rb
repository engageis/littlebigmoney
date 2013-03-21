# RailsAdmin config file. Generated on March 21, 2013 16:18
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  require 'i18n'
  I18n.default_locale = :en

  config.authenticate_with do
    config.authorize_with :cancan
  end

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Little Big Money', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Authorization', 'Backer', 'BackerReport', 'BackerReportsForProjectOwner', 'Category', 'Configuration', 'Notification', 'NotificationType', 'OauthProvider', 'PaymentNotification', 'Project', 'ProjectTotal', 'Reward', 'State', 'Statistics', 'Unsubscribe', 'Update', 'User', 'UserTotal']

  # Include specific models (exclude the others):
  config.included_models = ['Category', 'Configuration', 'Project', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block
  
  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Authorization  ###

  # config.model 'Authorization' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your authorization.rb model definition
  
  #   # Found associations:

  #     configure :oauth_provider, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :oauth_provider_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :uid, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Backer  ###

  # config.model 'Backer' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your backer.rb model definition
  
  #   # Found associations:

  #     configure :project, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :reward, :belongs_to_association 
  #     configure :payment_notifications, :has_many_association 
  #     configure :notifications, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :project_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :reward_id, :integer         # Hidden 
  #     configure :value, :decimal 
  #     configure :confirmed, :boolean 
  #     configure :confirmed_at, :datetime 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :anonymous, :boolean 
  #     configure :key, :text 
  #     configure :requested_refund, :boolean 
  #     configure :refunded, :boolean 
  #     configure :credits, :boolean 
  #     configure :notified_finish, :boolean 
  #     configure :payment_method, :text 
  #     configure :payment_token, :text 
  #     configure :payment_id, :string 
  #     configure :payer_name, :text 
  #     configure :payer_email, :text 
  #     configure :payer_document, :text 
  #     configure :address_street, :text 
  #     configure :address_number, :text 
  #     configure :address_complement, :text 
  #     configure :address_neighbourhood, :text 
  #     configure :address_zip_code, :text 
  #     configure :address_city, :text 
  #     configure :address_state, :text 
  #     configure :address_phone_number, :text 
  #     configure :payment_choice, :text 
  #     configure :payment_service_fee, :decimal 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BackerReport  ###

  # config.model 'BackerReport' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your backer_report.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :project_id, :integer 
  #     configure :name, :text 
  #     configure :value, :decimal 
  #     configure :minimum_value, :decimal 
  #     configure :description, :text 
  #     configure :payment_method, :text 
  #     configure :payment_choice, :text 
  #     configure :payment_service_fee, :decimal 
  #     configure :key, :text 
  #     configure :created_at, :date 
  #     configure :confirmed_at, :date 
  #     configure :email, :text 
  #     configure :payer_email, :text 
  #     configure :payer_name, :text 
  #     configure :cpf, :text 
  #     configure :address_street, :text 
  #     configure :address_complement, :text 
  #     configure :address_number, :text 
  #     configure :address_neighbourhood, :text 
  #     configure :address_city, :text 
  #     configure :address_state, :text 
  #     configure :address_zip_code, :text 
  #     configure :requested_refund, :boolean 
  #     configure :refunded, :boolean 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BackerReportsForProjectOwner  ###

  # config.model 'BackerReportsForProjectOwner' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your backer_reports_for_project_owner.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :project_id, :integer 
  #     configure :reward_id, :integer 
  #     configure :reward_description, :text 
  #     configure :confirmed_at, :date 
  #     configure :back_value, :decimal 
  #     configure :service_fee, :decimal 
  #     configure :user_email, :text 
  #     configure :user_name, :text 
  #     configure :payer_email, :text 
  #     configure :payment_method, :text 
  #     configure :street, :text 
  #     configure :complement, :text 
  #     configure :address_number, :text 
  #     configure :neighbourhood, :text 
  #     configure :city, :text 
  #     configure :state, :text 
  #     configure :zip_code, :text 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Category  ###

  # config.model 'Category' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your category.rb model definition
  
  #   # Found associations:

  #     configure :projects, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name_pt, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name_en, :string 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Configuration  ###

  # config.model 'Configuration' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your configuration.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :text 
  #     configure :value, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Notification  ###

  # config.model 'Notification' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your notification.rb model definition
  
  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :project, :belongs_to_association 
  #     configure :notification_type, :belongs_to_association 
  #     configure :backer, :belongs_to_association 
  #     configure :project_update, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :project_id, :integer         # Hidden 
  #     configure :dismissed, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :notification_type_id, :integer         # Hidden 
  #     configure :backer_id, :integer         # Hidden 
  #     configure :update_id, :integer         # Hidden 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  NotificationType  ###

  # config.model 'NotificationType' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your notification_type.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  OauthProvider  ###

  # config.model 'OauthProvider' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your oauth_provider.rb model definition
  
  #   # Found associations:

  #     configure :authorizations, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :text 
  #     configure :key, :text 
  #     configure :secret, :text 
  #     configure :scope, :text 
  #     configure :order, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :strategy, :text 
  #     configure :path, :text 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  PaymentNotification  ###

  # config.model 'PaymentNotification' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your payment_notification.rb model definition
  
  #   # Found associations:

  #     configure :backer, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :backer_id, :integer         # Hidden 
  #     configure :extra_data, :serialized 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Project  ###

  # config.model 'Project' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your project.rb model definition
  
  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :category, :belongs_to_association 
  #     configure :backers, :has_many_association 
  #     configure :rewards, :has_many_association 
  #     configure :updates, :has_many_association 
  #     configure :notifications, :has_many_association 
  #     configure :project_total, :has_one_association 
  #     configure :unsubscribes, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :text 
  #     configure :user_id, :integer         # Hidden 
  #     configure :category_id, :integer         # Hidden 
  #     configure :goal, :decimal 
  #     configure :expires_at, :datetime 
  #     configure :about, :text 
  #     configure :headline, :text 
  #     configure :video_url, :text 
  #     configure :image_url, :text 
  #     configure :short_url, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :can_finish, :boolean 
  #     configure :finished, :boolean 
  #     configure :about_html, :text 
  #     configure :visible, :boolean 
  #     configure :rejected, :boolean 
  #     configure :recommended, :boolean 
  #     configure :home_page_comment, :text 
  #     configure :successful, :boolean 
  #     configure :permalink, :text 
  #     configure :video_thumbnail, :carrierwave 
  #     configure :state, :string 
  #     configure :online_days, :integer 
  #     configure :online_date, :datetime 
  #     configure :how_know, :text 
  #     configure :more_links, :text 
  #     configure :first_backers, :text 
  #     configure :uploaded_image, :carrierwave 
  #     configure :kind, :string 
  #     configure :country, :string 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  ProjectTotal  ###

  # config.model 'ProjectTotal' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your project_total.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :project_id, :integer 
  #     configure :pledged, :decimal 
  #     configure :total_backers, :integer 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Reward  ###

  # config.model 'Reward' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your reward.rb model definition
  
  #   # Found associations:

  #     configure :project, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :backers, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :project_id, :integer         # Hidden 
  #     configure :minimum_value, :decimal 
  #     configure :maximum_backers, :integer 
  #     configure :description, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :reindex_versions, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  State  ###

  # config.model 'State' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your state.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :acronym, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Statistics  ###

  # config.model 'Statistics' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your statistics.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :total_users, :integer 
  #     configure :total_backs, :integer 
  #     configure :total_backers, :integer 
  #     configure :total_backed, :decimal 
  #     configure :total_projects, :integer 
  #     configure :total_projects_success, :integer 
  #     configure :total_projects_online, :integer 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Unsubscribe  ###

  # config.model 'Unsubscribe' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your unsubscribe.rb model definition
  
  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :notification_type, :belongs_to_association 
  #     configure :project, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :notification_type_id, :integer         # Hidden 
  #     configure :project_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Update  ###

  # config.model 'Update' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your update.rb model definition
  
  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :project, :belongs_to_association 
  #     configure :notifications, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :project_id, :integer         # Hidden 
  #     configure :title, :text 
  #     configure :comment, :text 
  #     configure :comment_html, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition
  
  #   # Found associations:

  #     configure :users_as_primary, :has_many_association 
  #     configure :oauth_providers, :has_many_association 
  #     configure :backs, :has_many_association 
  #     configure :user_total, :has_one_association 
  #     configure :notifications, :has_many_association 
  #     configure :backers, :has_many_association 
  #     configure :projects, :has_many_association 
  #     configure :unsubscribes, :has_many_association 
  #     configure :updates, :has_many_association 
  #     configure :authorizations, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :primary_user_id, :integer         # Hidden 
  #     configure :provider, :text 
  #     configure :uid, :text 
  #     configure :email, :text 
  #     configure :name, :text 
  #     configure :nickname, :text 
  #     configure :bio, :text 
  #     configure :image_url, :text 
  #     configure :newsletter, :boolean 
  #     configure :project_updates, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :admin, :boolean 
  #     configure :full_name, :text 
  #     configure :address_street, :text 
  #     configure :address_number, :text 
  #     configure :address_complement, :text 
  #     configure :address_neighbourhood, :text 
  #     configure :address_city, :text 
  #     configure :address_state, :text 
  #     configure :address_zip_code, :text 
  #     configure :phone_number, :text 
  #     configure :locale, :text 
  #     configure :cpf, :text 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :twitter, :string 
  #     configure :facebook_link, :string 
  #     configure :other_link, :string 
  #     configure :uploaded_image, :carrierwave 
  #     configure :moip_login, :string 
  #     configure :state_inscription, :string 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  UserTotal  ###

  # config.model 'UserTotal' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user_total.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :sum, :decimal 
  #     configure :count, :integer 
  #     configure :credits, :decimal 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
