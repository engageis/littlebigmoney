# Be sure to restart your server when you modify this file.

if Configuration[:base_domain]
  Catarse::Application.config.session_store :cookie_store, :key => '_lbm_session_2', :domain => Configuration[:base_domain]
else
  Catarse::Application.config.session_store :cookie_store, :key => '_lbm_session_2'
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# Catarse::Application.config.session_store :active_record_store

