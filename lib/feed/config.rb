require 'uri'
require 'redis'

module Feed
  module Config

    def redis
      @redis ||= ::Redis.new
    end

  end
end
