class Product < ActiveRecord::Base

  extend Feed

  after_create :piss

  feeds :after_create, :follower_ids

  def piss
    puts "pissed"
  end

  def feed_item
    { 
      name: 'peleg'
    }
  end

  def follower_ids
    [1, 2, 3]
  end

end