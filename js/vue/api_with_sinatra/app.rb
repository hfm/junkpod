require 'sinatra'
require 'sinatra/reloader'
require 'slim'

class MyApp < Sinatra::Application
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @message = 'This is MyApp'
    slim :index
  end

  run! if app_file == $0
end
