Rails.application.routes.draw do

  #static routes should be above dynamic routes, else all will be routed to first route (sequence matters!)

  get("/directors/eldest", { :controller => "directors", :action => "wisest"})

  get("/directors/:an_id", { :controller => "directors", :action => "director_details"})

  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index"})

end
