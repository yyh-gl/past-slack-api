class Api::V1::MessagesController < ApplicationController
  require 'json'

  # 全チャンネルのメッセージを取得（エクスポート）
  def index
    channels = Dir.glob("#{APP_ROOT_PATH}/log/slack/messages/*")
    channels.each do |ch|
      Dir.glob("#{ch}/*").each do |json_file|
        File.open(json_file) do |data|
          JSON.load(data).each do |hash|
            puts hash
          end
        end
      end
    end
  end

  # 指定チャンネルのメッセージを取得（エクスポート）
  def show

  end

  # 全チャンネルのメッセージをDBに保存
  def save_all_messages
    channels = Dir.glob("#{APP_ROOT_PATH}/log/slack/messages/*")
    channels.each do |ch|
      Dir.glob("#{ch}/*").each do |json_file|
        File.open(json_file) do |data|
          JSON.load(data).each do |hash|
            puts hash
          end
        end
      end
    end
  end

end
