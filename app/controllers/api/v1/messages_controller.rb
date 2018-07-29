class Api::V1::MessagesController < ApplicationController

  # 全チャンネルのメッセージを取得（エクスポート）
  def index
    public = Channel::fetch_channels('public')
    private = Channel::fetch_channels('private')
    channels = public['channels'] + private['channels']
    channels.each do |ch|
      # `#{APP_ROOT_PATH}/lib/slack-dump/slack-dump #{ch['ch_id']}`
    end
  end

  # 指定チャンネルのメッセージを取得（エクスポート）
  def show

  end

end
