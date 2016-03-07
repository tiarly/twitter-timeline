class FakeTwitterClient
  def initialize(faker_response: FakeTweet.new)
    @faker_response = faker_response
  end

  def user_timeline(*args)
    [@faker_response].flatten
  end
end

class FakeTweet
  def text
    'Tweet text'
  end

  def user
    FakeTweetUser.new
  end

  def created_at
    Time.zone.now
  end
end

class FakeTweetUser
  def profile_image_url
    '/img.png'
  end
end
