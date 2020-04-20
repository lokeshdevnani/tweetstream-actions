require 'rails_helper'

RSpec.describe TweetProcessor, type: :service do
  it 'works' do
    tp = TweetProcessor.new
    tp.register_trigger(NthUserTweetProcessor)
    tp.register_trigger(HashtagProcessor)

    config1 = ConfigHashtag.create(hashtag: 'india')
    criteria1 = Criterion.create(name: 'India hashtag', trigger_config: config1)
    criteria1.actions = [Action.create(action_type: 'HTTP',
                                      config: { url: 'http://dummy',
                                                method: 'post' })]

    config2 = ConfigNthUserTweet.create(username: 'tj', interval: 2)
    criteria2 = Criterion.create(name: 'every 2nd TJ tweet',
                                 trigger_config: config2)
    criteria2.actions = [Action.create(action_type: 'HTTP',
                                       config: { url: 'http://dummy2',
                                                 method: 'post' })]

    tweet1 = Tweet.new(username: 'tj', hashtags: ['great', 'india'],
                       content: '#india is #great', location: nil)
    tweet2 = Tweet.new(username: 'tj', hashtags: ['incredible', 'india'],
                       content: '#india is #incredible', location: nil)

    tasks = []
    expect_any_instance_of(TaskProcessor).to \
      receive(:perform_async).exactly(3).times do |_, task|
      tasks << task
    end

    tp.process_tweet(tweet1)
    tp.process_tweet(tweet2)

    expect(tasks[0].tweet.content).to eq(tweet1.content)
    expect(tasks[0].action.config['url']).to eq('http://dummy')

    expect(tasks[1].tweet.content).to eq(tweet2.content)
    expect(tasks[1].action.config['url']).to eq('http://dummy2')

    expect(tasks[2].tweet.content).to eq(tweet2.content)
    expect(tasks[2].action.config['url']).to eq('http://dummy')

    expect(UserTweetCounter.find_by(username: 'tj').tweet_count).to eq(2)
  end
end

