# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wizard_session',
  :secret      => 'a2fa8ef8b44902076659ea7a312a3b2bde4919779c646602fefe1ae5b85dc36acd46f1e0a6d9f59c37405c5a9866a42a1e705de1452b4ea21d1fd16eb16d7f3a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
