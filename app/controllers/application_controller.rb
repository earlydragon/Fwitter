require './config/environment'
require './app/models/tweet'
require './app/models/user'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "fwitter"
  end

  get '/' do 
    # @logged_in_user = User.find(session[:user_id])
    erb :tweets
  end 

  get '/messages' do
  		@tweets = Tweet.all
      @users = User.all 
  	erb :messages 
  end 

get '/profile' do
    @users = User.all   		
  	erb :profile
  end 

  get '/home' do 
    @logged_in_user = User.find(session[:user_id])
    # @users= Users.all 
  	erb :home
  end 

  post '/messages' do
  new_tweet = Tweet.new({:user_id => params[:user_id], :message => params[:message]})
  new_tweet.save
  redirect ('/messages')
  end 

  post '/profile' do
  new_user = User.new({:username => params[:username], :age => params[:age], :profile_pic => params[:profile_pic], :email => params[:email]})
  new_user.save
  redirect ('/profile')
  end 

  post '/' do
  @user = User.find_by(:username => params[:username], :email => params[:email])
  if @user
  session[:user_id] = @user.id
  redirect('/home')
  else
   erb :error
  end 
end 
end