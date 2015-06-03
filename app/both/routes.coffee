Router.configure
  layoutTemplate: 'app'

Router.route '/home', () ->
  @render 'home',
    data: ()-> 'hello from Home'

Router.route '/choose', () ->
  @render 'choose',
    data: ()-> 'hello from Home'

Router.route('/subscribe/:user', {where: 'server'})
  .get ()->
    Meteor.http
    @response.end @.params.user
  .post ()->
    @response.end 'hello post'

# Redirect to the /home route by default
Router.route('/', {where: 'server'})
  .get ()->
    @.response.writeHead(302,{'Location': '/home'})
    @.response.end()