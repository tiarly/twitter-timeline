module TweetsHelper
  def tweet_with_linked_mention(tweet_text)
    tweet_text.scan(/@([a-z0-9_]+)/i).flatten.each do |username|
      username = "@#{username}"
      tweet_text = tweet_text.gsub(username, add_mention_link(username))
    end

    tweet_text.html_safe
  end

  private

  def add_mention_link(username)
    link_to username, "http://www.twitter.com/#{username}"
  end
end
