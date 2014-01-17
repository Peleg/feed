require 'uri'
require 'redis'

module Feed
  module Config

    # Accepts:
    #   1. A Redis URL String 'redis://host:port/db'
    #   2. An existing instance of Redis, Redis::Namespace, etc.
    def redis=(server)
      if server.is_a?(String)
        @redis = nil
        @redis_url = server
      else
        @redis = server
      end

      redis
    end

    # Returns the current Redis connection. If none has been created, will
    # create a new one.
    def redis
      @redis ||= (
        url = URI(@redis_url || ENV["REDIS_URL"] || "redis://127.0.0.1:6379/0")

        ::Redis.new({
          :host => url.host,
          :port => url.port,
          :db => url.path[1..-1],
          :password => url.password
        })
      )
    end

  end
end