module Feed
  module Base
    
    def feeds(callback_hook, feed_ids_method)  
      send callback_hook do |obj|
        raise 'Object must have an ID' unless obj.id.present?
        Store.add_item! obj.send(feed_ids_method), obj
      end
    end

  end
end