class TweetsController < ApplicationController
  def index
    @tweets = if find_username.present?
                fetch_tweets
              else
                []
              end
  end

  private

  def find_username
    return nil if params[:username].nil?

    @username = params[:username].gsub('/@/', '')
  end

  def fetch_tweets
    TwitterTimeline.client.user_timeline(@username, count: 25)
  end
end
