class Api::V1::ChannelsController < ApplicationController
  before_action :set_token

  def index
    channels = send_request(REQ_CHANNEL_LIST, channel_params)
    json_response(channels)
  end

  def show
    channel = send_request(REQ_CHANNEL_INFO, channel_params)
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
