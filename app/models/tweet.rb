class Tweet
  attr_reader :username, :hashtags, :content, :location

  def initialize(username: nil, hashtags: [], content: nil, location: nil)
    @username = username
    @hashtags = hashtags
    @content = content
    @location = location

    raise ArgumentError, 'Username is required' if @username.blank?

    raise ArgumentError, 'Content is required' if @content.blank?
  end
end
