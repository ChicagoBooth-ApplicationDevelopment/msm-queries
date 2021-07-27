Rails.application.routes.draw do

  #static routes should be above dynamic routes, else all will be routed to first route (sequence matters!)

  get("/directors/eldest", { :controller => "directors", :action => "wisest"})

  get("/directors/youngest", { :controller => "directors", :action => "youngest"})

  get("/directors/:an_id", { :controller => "directors", :action => "director_details"})

  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index"})

  get("/movies", { :controller => "movies", :action => "index"})

  get("/movies/:movie_id", { :controller => "movies", :action => "movies_details"})

  get("/actors", { :controller => "actors", :action => "index"})

  get("/actors/:actor_id", { :controller => "actors", :action => "actor_details"})

end
