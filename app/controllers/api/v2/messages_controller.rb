class Api::V1::MessagesController < ApplicationController
  require 'json'

  # 全チャンネルのメッセージを取得
  def index
    messages = Message.all
    json_response(messages: messages)
  end

  # 指定チャンネルのメッセージを取得
  def show
    keyword = get_search_keyword(params)
    messages = Message.where(keyword)
    messages = messages.select { |message| message['text'].include?('そうですね') } if params[:text].present?
    json_response(messages: messages)
  end

  private

  def get_search_keyword(params)
    keyword = []
    keyword << "channel_name = '#{params[:channel]}'" if params[:channel].present?
    keyword << "user = '#{params[:user]}'" if params[:user].present?
    # TODO: AND で繋ぐと、うまくLIKE検索できない模様
    # keyword << "text LIKE '% #{params[:text]}%'" if params[:text].present?
    keyword.join(' AND ')
  end

end
