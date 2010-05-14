# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_itrc-pes_session',
  :secret      => 'a920f1684592ee92005277b297884472063db11eae2e3d878331eed96a2dbe32349d167b867e6c121f6fdcfc6b16c61d9bc5639ffba10e2a26df7e21822d1e31'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
