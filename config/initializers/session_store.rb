# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_product_catalog_session',
  :secret      => 'c78b91aca924bf3d5b8bfc5f5ec07ad99351be9d5035c941f86918ba3c05130bf05bfcaa01b6716a489f08f32961fed8ecbd4b55c2c3ceb124bac93d2d39eb90'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
