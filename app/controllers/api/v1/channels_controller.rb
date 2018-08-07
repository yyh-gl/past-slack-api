class Api::V1::ChannelsController < ApplicationController
  before_action :set_token

  def public_index
    channels = Channel::fetch_channels('public')
    slack_json_response(channels)
  end

  def private_index
    channels = Channel::fetch_channels('private')
    slack_json_response(channels)
  end

  def show
    channel = Channel::fetch_channel(params[:channel])
    slack_json_response(channel)
  end

  private

  def channel_params
    params.permit(:token, :channel)
  end

  def set_token
    params.merge(token: Slack.config.token)
  end

end