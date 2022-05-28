require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"

class Vas < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end

  get '/moderator' do
    erb :moderator
  end

  get '/admin'  do
    erb :admin
  end
end
