Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :instagram, "INSTAGRAM_CLIENT_ID", "INSTAGRAM_CLIENT_SECRET"
  # TODO move env.variables
  provider :instagram, 
  		"be1528c752644e288a700bd38d35130e", 
  		"167dd56822d34ab684cccd14e2444537", 
  		scope: 'basic'#+public_content+follower_list+comments+relationships+likes'
end