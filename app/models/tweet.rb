class Tweet
  attr_reader :username, :hashtags, :content, :location

  def initialize(username: nil, hashtags: [], content: nil, location: nil)
    @username = username
    @hashtags = hashtags
    @content = content
    @location = location
  end
end
