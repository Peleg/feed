require "feed/base"
require "feed/config"
require "feed/store"
require "feed/version"

module Feed
  def self.extended(model_class)
    model_class.class_eval do
      extend Base
    end
  end
end
