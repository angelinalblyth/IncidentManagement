require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/user.rb')
also_reload( '../models/*' )

#All User functions

#user index
get '/users' do
  @users = User.all()
  erb(:"users/index")
end

#new user
get '/users/new' do
  @users = User.all()
  erb(:"/users/new")
end

#show individual users
get '/users/:id' do
  @user = User.find(params[:id])
  erb(:"users/show")
end

#create a new user
post '/users' do
  User.new(params).save
  redirect to '/users'
end

#edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:"users/edit")
end

#update
post '/users/:id' do
  User.new(params).update()
  redirect to "/users/#{params['id']}"
end

#delete
post '/users/:id/delete' do
  User.delete( params[:id])
  redirect to '/users'
end
