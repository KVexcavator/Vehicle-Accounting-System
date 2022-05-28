require "sinatra/base"
require "sinatra/activerecord"
require "./vehicle"

class Vas < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  YEARS = ["2000","2001","2002","2003","2004"]
  MARKS = ["Audi","Ford","Honda"]
  MODELS = ["TT","Q5","A8","Escape","Fiesta","Focus","Accord","Integra","S2000"]

  get '/' do
    @title = "Vehicle Accounting System"
    session[:message] = "Session ready!"
    erb :index
  end

  get '/moderator' do
    @title = "Moderator page"
    @count = Vehicle.count
    erb :moderator
  end

  get '/admin'  do
    @title = "Admin page"
    @msg = session[:message]
    @uniqum = session[:uniqum]
    @added = session[:added]
    @repeated = session[:repeated]
    @vehicles = Vehicle.all
    erb :admin
  end

  post  '/add' do
    Vehicle.create(params[:vehicle])
    redirect to("/moderator")
  end

  post  '/admin/uniq' do
    # {"mark"=>"Audi", "model"=>"TT", "prod_year"=>"2000"}
    vehicles = Vehicle.where(mark: params[:vehicle][:mark], model: params[:vehicle][:model], prod_year: params[:vehicle][:prod_year])
    session[:uniqum] = vehicles.count
    redirect to("/admin")
  end

  post  '/admin/added'  do
    num = params[:period][:days].to_i
    period = Vehicle.where("created_at > ?", num.days.ago)
    session[:added] = period.count
    redirect to("/admin")
  end

  post  '/admin/repeated' do
    repeated = Vehicle.group(:reg_number).having('count(*) > 1').order('reg_number desc').count
    session[:repeated] = "We have a #{repeated.length} repeated auto."
    redirect to("/admin")
  end

  not_found do
    erb :not_found
  end

end
