class ApplicationController < ActionController::API
  include Request
  include Response
  include ExceptionHandler

  ## システム全般
  APP_ROOT_PATH = Rails.root

  ## APIリクエスト：メソッド名
  # users
  REQ_USER_LIST = 'users.list'.freeze
  # channels
  REQ_PUBLIC_CHANNEL_LIST = 'channels.list'.freeze
  REQ_PUBLIC_CHANNEL_INFO = 'channels.history'.freeze
  # groups
  REQ_PRIVATE_CHANNEL_LIST = 'groups.list'.freeze
  REQ_PRIVATE_CHANNEL_INFO = 'groups.history'.freeze

  ## エラーハンドリング：エラーとステータスコードの結びつけ
  # TODO: エラーシンボルを追加していく
  # https://blog.toshimaru.net/rails-http-status-symbols/
  # https://api.slack.com/methods/channels.info
  # https://api.slack.com/methods/channels.list
  ERROR = {
    channel_not_found: :not_found
  }.freeze

  # キャッシュ保持期間
  # CACHE_EXPIRES = 1.weeks
end
