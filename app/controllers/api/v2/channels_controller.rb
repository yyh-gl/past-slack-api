class Api::V2::ChannelsController < ApplicationController

  def public_index
    channels = Channel.fetch_channels('public')
    json_response(channels) if channels[:ok]
    json_response(channels, channels[:code])
    # slack_json_response(channels)
  end

  def private_index
    channels = Channel.fetch_channels('private')
    slack_json_response(channels)
  end

  def show
    channel = Channel.fetch_channel(channel_params)
    slack_json_response(channel)
  end

  private

  def channel_params
    params.permit(:channel)
  end

end