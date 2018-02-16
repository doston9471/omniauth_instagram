class SessionsController < ApplicationController
  before_action :get_access_token, only: :show
  
  def create
  	
  	@user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
  	session[:user_id] = @user.id
  	p "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  	p request.env['omniauth.auth']
  	session[:token] = request.env['omniauth.auth'].credentials.token
  	p session[:token]
  	p session[:user_id]
  	p "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  	redirect_to :me
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  def show
  	
	# request.env["omniauth.auth"]
  	render json: InstagramApi.user.show
  end

  private

    def get_access_token
      InstagramApi.config do |config|
	    config.access_token = current_user.access_token
	  # config.client_id = "be1528c752644e288a700bd38d35130e"
	  # config.client_secret = "167dd56822d34ab684cccd14e2444537"
	  end
    end

end

