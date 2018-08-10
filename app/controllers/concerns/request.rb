module Request
  require 'net/http'

  # キャッシュ保持期間
  CACHE_EXPIRES = 1.weeks

  def send_slack_request(method, params={})
    result = JSON.parse(Net::HTTP.get(create_uri(method, params)))
    if result['ok']
      Rails.cache.fetch("#{method}::#{Digest::SHA256.hexdigest(params.to_json)}", expires_in: CACHE_EXPIRES) do
        result
      end
    else
      result
    end
  end

  private

  def create_uri(method, params)
    URI.parse([Slack.config.api_url, method].join('/')).tap do |uri|
      uri.query = URI.encode_www_form({ token: Slack.config.token }.merge(params))
    end
  end
end