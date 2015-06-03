if Meteor.isServer
  Future = Meteor.npmRequire('fibers/future')
  Meteor.methods({
    getImages: ( iID , accessToken ) ->
      fut = new Future()
      Meteor.http.call "GET", "https://api.instagram.com/v1/users/#{iID}/media/recent?access_token=#{accessToken}", (err,res) ->
        if err then console.log err else
          fut.return(res)
      fut.wait()

    removeFromWall: (instagram_id) ->
      fut = new Future()
      WallImages.remove {instagram_id: instagram_id},(err, res)->
        if err
          fut.return(err)
        fut.return(res)
      fut.wait()

    makeSubscribtion: () ->
      fut = new Future()
      id = '12345'
      data=
        client_id: ''
        client_secret: ''
        object: 'tag'
        aspect: 'media'
        object_id: 'coffee'
        callback_url: "http://localhost:3000/board/#{id}/"

      Meteor.http.call("POST", "/test/asdf", data ,(err, res) ->
        if err then err
      )

      fut.wait()
  })