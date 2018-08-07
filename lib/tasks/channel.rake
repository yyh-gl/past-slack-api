namespace :channel do
  require "#{Rails.root}/app/controllers/concerns/request"
  include Request

  desc '（パブリックチャンネル）Slack APIのレスポンスをDBに保存'
  task :update_public => :environment do
    channels = send_slack_request(ApplicationController::REQ_PUBLIC_CHANNEL_LIST)
    channels['channels'].each do |ch|
      unless Channel.exists?(ch_id: ch['id'])
        Channel.create(ch_id: ch['id'], name: ch['name'], ch_type: 'public')
      end
    end
    puts channels
  end

  desc '（プライベートチャンネル）Slack APIのレスポンスをDBに保存'
  task :update_private => :environment do
    channels = send_slack_request(ApplicationController::REQ_PRIVATE_CHANNEL_LIST)
    channels['groups'].each do |ch|
      unless Channel.exists?(ch_id: ch['id'])
        Channel.create(ch_id: ch['id'], name: ch['name'], ch_type: 'private')
      end
    end
    puts channels
  end

end
