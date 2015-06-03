if Meteor.isClient
  Meteor.startup ()->
    @InstagramImages = new Meteor.Collection (null)
    @WallImages = new Meteor.Collection 'WallImages'

UI.registerHelper 'accessToken', () ->
  Session.get 'accessToken' or 'noToken'

UI.registerHelper 'InstagramId', () ->
  Session.get 'instagramId' or 'noId'

Accounts.onLogin ()->
  $user = Meteor.user()
  $id = $user.services.instagram['id'];
  $accessToken = $user.services.instagram['accessToken'];
  Session.set 'instagramId', $id
  Session.set 'accessToken', $accessToken