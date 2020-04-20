class ListenController < ApplicationController
  WHITELISTED_TWEET_KEYS = [:username, :content, :location]

  # POST /listen
  def listen
    @tweet = Tweet.new(tweet_params)
    TweetProcessor.with_default_triggers.process_tweet(@tweet)
    render json: { ok: true, time: Time.now.to_s }
  rescue StandardError => e
    render json: { ok: false, time: Time.now.to_s, error: e.message},
           status: :unprocessable_entity
  end

  private
    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.fetch(:tweet, {})[:tweet]
            .permit(*WHITELISTED_TWEET_KEYS, hashtags: [])
            .as_json.symbolize_keys
    end
end
