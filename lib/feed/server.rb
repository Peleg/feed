require 'sinatra/base'
require 'feed'
require 'rack/contrib'

module Feed
  class Server < Sinatra::Base
    
    use Rack::JSONP
    
    before do
      content_type 'application/json', :charset => 'utf-8'
    end
    
    get '/' do
      raise Sinatra::NotFound unless params[:feed_id]
      items_count = (params[:limit] || 10).to_i
      feed_id = params[:feed_id]
      
      MultiJson.encode({
        feed: Store.get_feed(feed_id, items_count)
      })
    end
    
    not_found do
      content_type 'application/json', :charset => 'utf-8'
      MultiJson.encode({ :error => "not found" })
    end
    
  end
end