require 'sinatra'
require 'sinatra/sequel'

# ---------------------------------- Configuration

set :database, 'sqlite://db/qcs_development.sqlite'
dataset = database[:subscribers]
set :haml, format: :html5, views: 'app/views', layout: :'layouts/application'

models = File.join(File.dirname(__FILE__), 'app', 'models') # path to your models
$LOAD_PATH << File.expand_path(models)

# Constent Missing for requiring models files
def Object.const_missing(const)
  require const.to_s.downcase
  klass = const_get(const)
  return klass if klass
end

# ---------------------------------- Helpers

helpers do
  def current_subscribers
    Subscriber.all
  end
end

# ---------------------------------- Routes

get '/' do
  haml :index
end

post '/' do
  begin
    @success = Subscriber.create(params[:subscriber])
  rescue Sequel::ValidationFailed => e
    @success = false
    @message = "Whoops! #{e.message.capitalize}."
  end
  haml :index
end

get '/test' do
  Subscriber.first.email
end

