require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/issue_controller')
require_relative('controllers/user_controller')


get '/' do # dashboard
  erb(:home)
end
