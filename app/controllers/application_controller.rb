require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do  
  erb :tweets
  end 

  get '/messages' do
  		@tweets = Tweet.all_messages
  	erb :messages 
  end 

    get '/profile' do  		
  	erb :profile
  end 

  post '/tweets' do
  	new_tweet = Tweet.new(params[:user],params[:message])
  	redirect ('/')
  end 

end