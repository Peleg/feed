module Feed
  class Store
    include Config
    attr_accessor :feed_ids, :feed_object, :feed_id, :items_count

    # TODO: 
    # This will never delete values. However unread values will be written to disk and forgotten.
    # Make feed as detailed as possible and work some more on Feeded.
    # Given no DB trips are necessary when feed is retrieved, should it event hit our stack? (Sinatra maybe?)

    class << self
      
      def add_item!(feed_ids, feed_object)
        store = new feed_ids: feed_ids, feed_object: feed_object
        store.store_item!
        store.push_key!
      end

      def remove_item!(feed_ids, feed_object)
        store = new feed_ids: feed_ids, feed_object: feed_object
        # remove
      end
      
      def get_feed(feed_id, items_count = 100)
        store = new feed_id: feed_id, items_count: items_count
        store.items
      end

    end

    def initialize(params)
      params.each do |k, v|
        send("#{k}=", v)
      end
    end

    # IN
    
    def store_item!
      redis.hset hash_key, item_key, item
    end

    def push_key!
      redis.multi do
        feed_ids.each do |feed_id|
          redis.lpush feed_id, item_key
        end
      end
    end

    # OUT

    def items
      redis.hmget hash_key, item_ids
    end

    def item_ids
      redis.lrange(feed_id, 0, items_count)
    end

    private
    # HELPERS

    def hash_key
      "items"
    end

    def item_key
      @item_key ||= "#{feed_object.class}:#{feed_object.id}"
    end

    def item
      feed_object.feed_item.to_json
    end

  end
end