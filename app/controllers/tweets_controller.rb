class TweetsController < ApplicationController
  rescue_from Twitter::Error::NotFound, with: :username_not_found

  def index
    @tweets = if find_username.present?
                fetch_tweets
              else
                render :username_empty
              end
  end

  private

  def username_not_found
    render :username_not_found
  end

  def find_username
    return if params[:username].nil?

    @username = params[:username].gsub('/@/', '')
  end

  def fetch_tweets
    TwitterTimeline.client.user_timeline(@username, count: 25)
  end
end
