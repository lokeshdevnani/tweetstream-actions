class HTTPTask < Task
  def execute
    url, method = @action.config.values_at('url', 'method')
    payload = {
        tweet: @tweet.as_json,
        criteria: @action.criterion.as_json,
        extra: @extra
    }
    response = HTTP.send(method, url, {body: payload})
    Rails.logger.log("Action: #{@action.id} triggered")
    Rails.logger.log("Response: #{response.code}")
    return true
  rescue StandardError => e
    Rails.logger.fatal("HTTPTask: #{e.message}")
    return false
  end
end
