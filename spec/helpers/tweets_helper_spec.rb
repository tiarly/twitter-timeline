require 'rails_helper'

RSpec.describe TweetsHelper, type: :helper do
  describe '#tweet_with_linked_mention' do
    it 'returns a processed tweet with a anchor tag' do
      tweet = 'hello @tiarly, how are you?'
      tweet_link = "<a href=\"http://www.twitter.com/@tiarly\">@tiarly</a"

      expect(helper.tweet_with_linked_mention(tweet)).to include(tweet_link)
    end

    it 'returns the same tweet body when no mentions are found' do
      tweet = 'hello tiarly, how are you?'

      expect(helper.tweet_with_linked_mention(tweet)).to eq tweet
    end
  end
end
