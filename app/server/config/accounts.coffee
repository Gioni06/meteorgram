# Setup Instagram OAuth
ServiceConfiguration.configurations.remove
  service: 'instagram'
ServiceConfiguration.configurations.insert
  service: 'instagram'
  clientId: 'c6a6ee4998554bf49ff7709c56fef756'
  secret: 'c3061c15271d4d0aab422def549ec998'

Accounts.onCreateUser (options, user) ->
  if options.profile
    options.profile.picture = options.services.instagram.profile_picture
    user.profile = options.profile
  user


