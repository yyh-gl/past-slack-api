class Api::V1::ChannelsController < ApplicationController
  before_action :set_token

  def api_public_index
    channels = send_slack_request(REQ_PUBLIC_CHANNEL_LIST, channel_params)
    channels['channels'].each do |ch|
      unless Channel.exists?(ch_id: ch['id'])
        Channel.create(ch_id: ch['id'], name: ch['name'], ch_type: 'public')
      end
    end
    json_response(channels)
  end

  # TODO: プライベートは自分が所属するもののみ取得可能なので
  # Botを追加するとか考える
  def api_private_index
    channels = send_slack_request(REQ_PRIVATE_CHANNEL_LIST, channel_params)
    channels['groups'].each do |ch|
      unless Channel.exists?(ch_id: ch['id'])
        Channel.create(ch_id: ch['id'], name: ch['name'], ch_type: 'private')
      end
    end
    json_response(channels)
  end

  def api_show
    channel = send_slack_request(REQ_PUBLIC_CHANNEL_INFO, channel_params)
    channel = send_slack_request(REQ_PRIVATE_CHANNEL_INFO, channel_params) unless channel['ok']
    json_response(channel)
  end

  def db_public_index
    channels = Channel::fetch_channels('public')
    json_response(channels)
  end

  def db_private_index
    channels = Channel::fetch_channels('private')
    json_response(channels)
  end

  def db_show
    channel = Channel::fetch_channel(params[:channel])
    json_response(channel)
  end

  private

  def channel_params
    params.permit(:token, :channel)
  end

  def set_token
    params.merge(token: Slack.config.token)
  end

end
