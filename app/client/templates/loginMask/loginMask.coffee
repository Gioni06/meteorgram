Template.loginMask.events
  'click .login-with-instagram-button': (e)->
    e.preventDefault()
    Meteor.loginWithInstagram {
    }, (err)->
      if err then console.log err
      Router.go('/choose');

  'click .logout': (e)->
    e.preventDefault()
    Meteor.logout (err)->
      if err then alert err
      Router.go('/home');