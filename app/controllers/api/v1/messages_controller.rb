class Api::V1::MessagesController < ApplicationController
  require 'json'

  # 全チャンネルのメッセージを取得
  def index
    messages = Message.all
    json_response(messages.to_json)
  end

  # 指定チャンネルのメッセージを取得
  def show
    
  end

end
