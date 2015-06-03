if Meteor.isServer
  Meteor.startup ()->
    @InstagramImages = new Meteor.Collection (null)
    @WallImages = new Meteor.Collection 'WallImages'