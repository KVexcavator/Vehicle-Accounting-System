require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"

class Vas < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    "This is connected to ....."
  end
end
