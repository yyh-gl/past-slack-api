module Slack
  def self.config
    @@config ||= OpenStruct.new({
      api_url:           nil,
      oauth_url:         nil,
      token:             nil,
      searchable_token:  nil,
      client_id:         nil,
      client_secret_key: nil,
      team_id:           nil,
    })
  end
end

Slack.config.api_url           = ENV['SLACK_API_URL']
Slack.config.oauth_url         = ENV['SLACK_OAUTH_URL']
Slack.config.token             = ENV['SLACK_TOKEN']
Slack.config.searchable_token  = ENV['SLACK_TOKEN']
Slack.config.client_id         = ENV['SLACK_CLIENT_ID']
Slack.config.client_secret_key = ENV['SLACK_CLIENT_SECRET_KEY']
Slack.config.team_id           = ENV['SLACK_TEAM_ID']