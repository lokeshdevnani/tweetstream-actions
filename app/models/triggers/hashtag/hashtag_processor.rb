class HashtagProcessor < BaseProcessor
  def process
    trigger_configs = ConfigHashtag.where(hashtag: @tweet.hashtags)
    matching_criteria_list = Criterion.where(trigger_config: trigger_configs)
    actions = Action.where(criterion: matching_criteria_list)
    actions.each do |action|
      task = Task.for_type(action.action_type)
                 .new(action: action, tweet: @tweet,
                      extra: { hashtags: @tweet.hashtags })
      enqueue_task(task)
    end
  end
end
