class MeController < ApplicationController
  before_action :authenticate
  before_action :get_access_token, only: [:user_info, :user_media]
  
  def user_info
    @user_info = {}
    user_information = InstagramApi.user.show
    @user_info[:username] = user_information[:data][:username]
    @user_info[:profile_picture] = user_information[:data][:profile_picture]
    @user_info[:uid] = user_information[:data][:id]
    @user_info[:full_name] = user_information[:data][:full_name]
    @user_info[:bio] = user_information[:data][:bio]
    @user_info[:website] = user_information[:data][:website]
    @user_info[:is_business] = user_information[:data][:is_business]
    @user_info[:number_of_followers] = user_information[:data][:counts][:followed_by]
    @user_info[:number_of_followings] = user_information[:data][:counts][:follows]
    respond_to do |format|
      format.html
      format.json { render json: @user_info }
    end
  end

  def user_media
    media_id = params[:media_id]
    @media = InstagramApi.media(media_id).show
    respond_to do |format|
      format.html
      format.json { render json: @media }
    end
  end

  private

    def get_access_token
      InstagramApi.config do |config|
        config.access_token = current_user.access_token
      end
    end
end
