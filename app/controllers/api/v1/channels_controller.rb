class Api::V1::ChannelsController < ApplicationController
  before_action :set_token

  def api_public_index
    channels = send_request(REQ_PUBLIC_CHANNEL_LIST, channel_params)
    channels['channels'].each do |ch|
      unless Channel.exists?(ch_id: ch['id'])
        Channel.create(ch_id: ch['id'], name: ch['name'], ch_type: 'public')
      end
    end
    json_response(channels)
  end

  # TODO: プライベートは自分が所属するもののみ取得可能
  def api_private_index
    channels = send_request(REQ_PRIVATE_CHANNEL_LIST, channel_params)
    channels['groups'].each do |ch|
      unless Channel.exists?(ch_id: ch['id'])
        Channel.create(ch_id: ch['id'], name: ch['name'], ch_type: 'private')
      end
    end
    json_response(channels)
  end

  def api_show
    channel = send_request(REQ_PUBLIC_CHANNEL_INFO, channel_params)
    json_response(channel)
  end

  def db_public_index
    channels = Channel.find_by(ch_type: 'public')
    json_response(channels)
  end

  def db_private_index
    channels = Channel.find_by(ch_type: 'private')
    json_response(channels)
  end

  def db_show
    channel = Channel.find_by(name: params[:channel])
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
