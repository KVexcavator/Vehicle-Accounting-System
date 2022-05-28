require "sinatra/base"
require "sinatra/activerecord"
require "./vehicle"

class Vas < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    @title = "Vehicle Accounting System"
    erb :index
  end

  get '/moderator' do
    @title = "Moderator page"
    @count = Vehicle.count
    @years = ["2000","2001","2002","2003","2004"]
    @marks = ["Audi","Ford","Honda"]
    @models = ["TT","Q5","A8","Escape","Fiesta","Focus","Accord","Integra","S2000"]
    erb :moderator
  end

  get '/admin'  do
    @title = "Admin page"
    erb :admin
  end

  post '/add' do
    Vehicle.create(params[:vehicle])
    redirect to("/moderator")
  end

  not_found do
    erb :not_found
  end

end
