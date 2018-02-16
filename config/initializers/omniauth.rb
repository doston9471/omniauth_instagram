Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :instagram, "INSTAGRAM_CLIENT_ID", "INSTAGRAM_CLIENT_SECRET"
  # TODO move env.variables
  provider :instagram, 
  		ENV['INSTAGRAM_CLIENT_ID'],
  		ENV['INSTAGRAM_CLIENT_SECRET'], 
  		scope: 'basic'#+public_content+follower_list+comments+relationships+likes'
end