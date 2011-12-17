# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ast_session',
  :secret      => '376b2085c61196f6b7c3f2f40d500a2b716228d37fa46dda9f06050bbd0e89b24a04647fbc5bdf0f32a1bb62028b1cba93c016f64cf2f71ecebdea798eaeb233'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
