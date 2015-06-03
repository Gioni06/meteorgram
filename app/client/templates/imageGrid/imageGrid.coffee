Template.imageGrid.onRendered ()->
  instagramId = Session.get('instagramId')
  accessToken = Session.get('accessToken')
  Meteor.call "getImages",instagramId,accessToken, (err,res) ->
    Session.set 'calledBefore', true
    _.each res.data.data, (item)->
      unless InstagramImages.find(item).count() > 0
        InstagramImages.insert(item)


Template.imageGrid.events
  'click .load-images-button': (e)->
    e.preventDefault()

  'click .image-chooser': (e)->
    e.preventDefault()
    console.log e.currentTarget.dataset.highResolution

Template.imageGrid.helpers
  InstagramImages: ()->
    InstagramImages.find({})

Template.checkmark.events
   'click .checkmark': ()->
      WallImages.insert
        instagram_id : @.id
        owner: Meteor.user_id
        standard_resolution: @.images.standard_resolution
   'click .inCollection': ()->
      console.log @._id
      Meteor.call 'removeFromWall', @.id, (err,res)->
        console.log err
        console.log res


 Template.checkmark.helpers
  inCollection: ()->
    theId =  this.id
    isInCollection = false
    if WallImages.find({instagram_id : theId}).count() > 0 then isInCollection = true
    isInCollection