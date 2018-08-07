class Api::V2::MessagesController < ApplicationController
  require 'json'

  # 全チャンネルのメッセージを取得
  def index
    messages = Message.all
    res_message = create_message_response(messages)
    json_response(res_message)
  end

  # 指定チャンネルのメッセージを取得
  def show
    keyword = get_search_keyword(message_params)
    messages = Message.where(keyword)
    messages = messages.select { |message| message['text'].include?(message_params[:text]) } if message_params[:text].present?
    res_message = create_message_response(messages)
    json_response(res_message)
  end

  private

  def message_params
    params.permit(:text, :channel, :user)
  end

  def get_search_keyword(params)
    keyword = []
    keyword << "channel_name = '#{params[:channel]}'" if params[:channel].present?
    keyword << "user = '#{params[:user]}'" if params[:user].present?
    # TODO: AND で繋ぐと、うまくLIKE検索できない模様
    # keyword << "text LIKE '% #{params[:text]}%'" if params[:text].present?
    keyword.join(' AND ')
  end

end
