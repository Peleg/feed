
Dummy::Application.routes.draw do

  mount Feed::Server, :at => "/feed"

end
