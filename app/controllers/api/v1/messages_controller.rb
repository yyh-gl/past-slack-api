class Api::V1::MessagesController < ApplicationController

  # 全チャンネルのメッセージを取得（エクスポート）
  def index
    `#{APP_ROOT_PATH}/lib/slack-dump/slack-dump -h`
  end

  # 指定チャンネルのメッセージを取得（エクスポート）
  def show

  end

end
