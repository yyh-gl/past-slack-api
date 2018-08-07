class Api::V2::ChannelsController < ApplicationController

  def public_index
    channels = Channel.where(ch_type: 'public')
    res_channels = create_channel_response(channels)
    json_response(res_channels)
  end

  def private_index
    channels = Channel.where(ch_type: 'private')
    res_channels = create_channel_response(channels)
    json_response(res_channels)
  end

  def show
    channel = Channel.find_by_ch_id(channel_params[:channel])
    res_channel = create_channel_response(channel)
    json_response(res_channel)
  end

  private

  def channel_params
    params.permit(:channel)
  end

end