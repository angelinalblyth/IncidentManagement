require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/issue.rb')
also_reload( '../models/*' )

#All Issue functions

#Issue index
get '/issues' do
  @issues = Issue.all()
  erb(:"issues/index")
end

#new issue
get '/issues/new' do
  @issues = Issue.all()
  erb(:"/issues/new")
end

#show individual issues
get '/issues/:id' do
  @issue = Issue.find(params[:id])
  erb(:"issues/show")
end

#create a new issue
post '/issues' do
  Issue.new(params).save
  redirect to '/issues'
end

#edit
get '/issues/:id/edit' do
  @issue = Issue.find(params[:id])
  erb(:"issues/edit")
end

#update
post '/issues/:id' do
  Issue.new(params).update()
  redirect to "/issues/#{params['id']}"
end

#delete
post '/issues/:id/delete' do
  Issue.delete( params[:id])
  redirect to '/issues'
end
