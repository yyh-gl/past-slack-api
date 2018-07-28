class ApplicationController < ActionController::API
  include Request
  include Response
  include ExceptionHandler

  ## APIリクエスト：メソッド名
  # channel
  REQ_CHANNEL_LIST = 'channels.list'.freeze
  REQ_CHANNEL_INFO = 'channels.info'.freeze

  ## エラーハンドリング：エラーとステータスコードの結びつけ
  # TODO: エラーシンボルを追加していく
  # https://blog.toshimaru.net/rails-http-status-symbols/
  # https://api.slack.com/methods/channels.info
  # https://api.slack.com/methods/channels.list
  ERROR = {
    channel_not_found: :not_found
  }.freeze
end
